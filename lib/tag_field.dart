library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tag_field/tag_provider.dart';

export 'package:provider/provider.dart'; // Export provider if needed

export 'tag_field.dart';

class TagField extends StatefulWidget {
  // Tag Data
  final List<String> initialTags;
  final int? maxTags;
  final bool allowDuplicates;

  // Input Field Customization
  final String hintText;
  final TextStyle? inputTextStyle;
  final InputDecoration? inputDecoration;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<String> separators;

  // Tag Appearance
  final Color tagBackgroundColor;
  final Color tagTextColor;
  final Color tagBorderColor;
  final double tagBorderWidth;
  final double tagBorderRadius;
  final TextStyle? tagTextStyle;
  final EdgeInsetsGeometry tagPadding;
  final EdgeInsetsGeometry tagMargin;
  final double tagSpacing;
  final double tagRunSpacing;

  // Delete Icon Customization
  final IconData deleteIcon;
  final Color deleteIconColor;
  final double deleteIconSize;
  final bool showDeleteIcon;

  // Container Customization
  final Color containerBackgroundColor;
  final Color containerBorderColor;
  final double containerBorderWidth;
  final double containerBorderRadius;
  final EdgeInsetsGeometry containerPadding;
  final double? containerHeight;
  final double? containerMinHeight;
  final double? containerMaxHeight;

  // Layout Options
  final TagInputLayout layout;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;

  // Animation
  final Duration animationDuration;
  final Curve animationCurve;
  final bool enableAnimations;

  // Callbacks
  final Function(List<String>)? onTagsChanged;
  final Function(String)? onTagAdded;
  final Function(String)? onTagRemoved;
  final String? Function(String)? tagValidator;
  final Widget Function(String, int, VoidCallback)? tagBuilder;

  // Behavior
  final bool autofocus;
  final bool trimTags;
  final bool caseSensitive;
  final bool submitOnEnter;
  final bool clearInputOnSubmit;
  final TextOverflow tagTextOverflow;
  final int? maxTagLines;
  const TagField({
    super.key,
    this.initialTags = const [],
    this.maxTags,
    this.allowDuplicates = false,
    this.hintText = 'Add tags...',
    this.inputTextStyle,
    this.inputDecoration,
    this.enabled = true,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.separators = const [' ', ',', '\n'],
    this.tagBackgroundColor = const Color(0xFFE3F2FD),
    this.tagTextColor = const Color(0xFF1976D2),
    this.tagBorderColor = const Color(0xFF90CAF9),
    this.tagBorderWidth = 1.0,
    this.tagBorderRadius = 16.0,
    this.tagTextStyle,
    this.tagPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.tagMargin = const EdgeInsets.only(right: 6, bottom: 6),
    this.tagSpacing = 6.0,
    this.tagRunSpacing = 6.0,
    this.deleteIcon = Icons.close,
    this.deleteIconColor = const Color(0xFF666666),
    this.deleteIconSize = 16.0,
    this.showDeleteIcon = true,
    this.containerBackgroundColor = Colors.transparent,
    this.containerBorderColor = const Color(0xFFE0E0E0),
    this.containerBorderWidth = 1.0,
    this.containerBorderRadius = 8.0,
    this.containerPadding = const EdgeInsets.all(8.0),
    this.containerHeight,
    this.containerMinHeight,
    this.containerMaxHeight,
    this.layout = TagInputLayout.wrap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.enableAnimations = true,
    this.onTagsChanged,
    this.onTagAdded,
    this.onTagRemoved,
    this.tagValidator,
    this.tagBuilder,
    this.autofocus = false,
    this.trimTags = true,
    this.caseSensitive = false,
    this.submitOnEnter = true,
    this.clearInputOnSubmit = true,
    this.tagTextOverflow = TextOverflow.ellipsis,
    this.maxTagLines = 1,
  });

  @override
  State<TagField> createState() => _TagFieldState();
}

class _TagFieldState extends State<TagField> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late FocusNode _focusNode;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildDefaultTag(String tag, int index, VoidCallback onDelete) {
    return AnimatedContainer(
      duration:
          widget.enableAnimations ? widget.animationDuration : Duration.zero,
      curve: widget.animationCurve,
      margin: widget.tagMargin,
      padding: widget.tagPadding,
      decoration: BoxDecoration(
        color: widget.tagBackgroundColor,
        border: Border.all(
          color: widget.tagBorderColor,
          width: widget.tagBorderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.tagBorderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            // Allow text to shrink if needed
            child: Text(
              tag,
              style: widget.tagTextStyle ??
                  TextStyle(color: widget.tagTextColor, fontSize: 14),
              overflow: widget.tagTextOverflow,
              maxLines: widget.maxTagLines,
              softWrap: widget.maxTagLines != null && widget.maxTagLines! > 1,
            ),
          ),
          if (widget.showDeleteIcon && widget.enabled) ...[
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onDelete,
              child: Icon(
                widget.deleteIcon,
                size: widget.deleteIconSize,
                color: widget.deleteIconColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(String tag, int index, TagInputNotifier notifier) {
    onDelete() => notifier.removeTag(index);

    if (widget.tagBuilder != null) {
      return widget.tagBuilder!(tag, index, onDelete);
    }

    return _buildDefaultTag(tag, index, onDelete);
  }

  Widget _buildTags(List<String> tags, TagInputNotifier notifier) {
    if (tags.isEmpty) return const SizedBox.shrink();

    switch (widget.layout) {
      case TagInputLayout.wrap:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );

      case TagInputLayout.inline:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );

      case TagInputLayout.column:
        return Column(
          crossAxisAlignment: widget.crossAxisAlignment,
          mainAxisAlignment: widget.mainAxisAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );
      case TagInputLayout.insideBelow:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );
      case TagInputLayout.outsideBelow:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );
      case TagInputLayout.outsideAbove:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags
              .asMap()
              .entries
              .map((entry) => _buildTag(entry.value, entry.key, notifier))
              .toList(),
        );
    }
  }

  Widget _buildInputField(TagInputNotifier notifier) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      style: widget.inputTextStyle,
      textInputAction: widget.textInputAction,
      decoration: widget.inputDecoration ??
          InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
      onChanged: (text) {
        for (String separator in widget.separators) {
          if (text.contains(separator)) {
            final parts = text.split(separator);
            if (parts.isNotEmpty) {
              final tagToAdd = parts.first;
              if (tagToAdd.isNotEmpty) {
                notifier.addTag(widget.allowDuplicates, tagToAdd, context);
                if (widget.clearInputOnSubmit) {
                  _controller.clear();
                }
              }
            }
            return;
          }
        }
      },
      onSubmitted: (text) {
        if (widget.submitOnEnter) {
          notifier.addTag(widget.allowDuplicates, text, context);
          if (widget.clearInputOnSubmit) {
            _controller.clear();
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TagInputNotifier(widget),
      child: Consumer<TagInputNotifier>(
        builder: (context, notifier, child) {
          return GestureDetector(
            onTap: () => _focusNode.requestFocus(),
            child: Container(
              height: widget.containerHeight,
              constraints: BoxConstraints(
                minHeight: widget.containerMinHeight ?? 0,
                maxHeight: widget.containerMaxHeight ?? double.infinity,
              ),
              padding: widget.containerPadding,
              decoration: BoxDecoration(
                color: widget.containerBackgroundColor,
                border: Border.all(
                  color: widget.containerBorderColor,
                  width: widget.containerBorderWidth,
                ),
                borderRadius: BorderRadius.circular(
                  widget.containerBorderRadius,
                ),
              ),
              child: widget.layout == TagInputLayout.inline
                  ? Wrap(
                      spacing: widget.tagSpacing,
                      runSpacing: widget.tagRunSpacing,
                      alignment: widget.wrapAlignment,
                      crossAxisAlignment: widget.wrapCrossAlignment,
                      children: [
                        ...notifier.tags.asMap().entries.map(
                              (entry) =>
                                  _buildTag(entry.value, entry.key, notifier),
                            ),
                        Container(
                          constraints: const BoxConstraints(minWidth: 100),
                          child: IntrinsicWidth(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: _buildInputField(notifier),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: widget.crossAxisAlignment,
                      mainAxisAlignment: widget.mainAxisAlignment,
                      children: [
                        _buildTags(notifier.tags, notifier),
                        if (notifier.tags.isNotEmpty) const SizedBox(height: 8),
                        _buildInputField(notifier),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
