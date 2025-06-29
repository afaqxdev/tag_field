/// A Flutter library for creating customizable tag input fields.
///
/// This library provides a comprehensive tag input widget that allows users to
/// add, remove, and display tags with extensive customization options for
/// appearance, behavior, and layout.
library;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tag_field/tag_provider.dart';

export 'package:provider/provider.dart'; // Export provider if needed

export 'tag_field.dart';

/// A highly customizable tag input field widget for Flutter applications.
///
/// [TagField] provides a complete solution for tag input with features including:
/// - Multiple layout options (wrap, inline, column, etc.)
/// - Extensive visual customization
/// - Tag validation and duplicate checking
/// - Animation support
/// - Custom tag builders
/// - Various input behaviors
///
/// Example usage:
/// ```dart
/// TagField(
///   initialTags: ['flutter', 'dart'],
///   maxTags: 10,
///   allowDuplicates: false,
///   hintText: 'Add programming languages...',
///   onTagsChanged: (tags) {
///     print('Tags updated: $tags');
///   },
///   tagBackgroundColor: Colors.blue.shade100,
///   tagTextColor: Colors.blue.shade800,
/// )
/// ```
class TagField extends StatefulWidget {
  // Tag Data Configuration

  /// The initial list of tags to display when the widget is first created.
  ///
  /// These tags will be added to the field automatically and can be removed
  /// by the user if [showDeleteIcon] is enabled.
  final List<String> initialTags;

  /// The maximum number of tags that can be added to the field.
  ///
  /// When this limit is reached, no more tags can be added. Set to `null`
  /// for unlimited tags.
  final int? maxTags;

  /// Whether duplicate tags are allowed in the field.
  ///
  /// When `false`, attempting to add a duplicate tag will show an error message.
  /// Comparison respects [caseSensitive] and [trimTags] settings.
  final bool allowDuplicates;

  // Input Field Customization

  /// The hint text displayed in the input field when it's empty.
  final String hintText;

  /// The text style applied to the input field text.
  ///
  /// If not provided, uses the default text style from the theme.
  final TextStyle? inputTextStyle;

  /// Custom input decoration for the text field.
  ///
  /// If not provided, uses a simple decoration with no border and the [hintText].
  final InputDecoration? inputDecoration;

  /// Whether the input field is enabled for user interaction.
  ///
  /// When `false`, the field becomes read-only and users cannot add or remove tags.
  final bool enabled;

  /// Custom focus node for the input field.
  ///
  /// If not provided, the widget creates its own focus node internally.
  final FocusNode? focusNode;

  /// The action to show on the keyboard when the input field is focused.
  final TextInputAction textInputAction;

  /// List of characters that trigger tag creation when typed.
  ///
  /// Common separators include space, comma, and newline. When any of these
  /// characters are typed, the current input is converted to a tag.
  final List<String> separators;

  // Tag Appearance Customization

  /// The background color of individual tags.
  final Color tagBackgroundColor;

  /// The text color for tag labels.
  final Color tagTextColor;

  /// The border color for tags.
  final Color tagBorderColor;

  /// The width of the tag borders in logical pixels.
  final double tagBorderWidth;

  /// The border radius for tag corners in logical pixels.
  final double tagBorderRadius;

  /// Custom text style for tag labels.
  ///
  /// If not provided, uses [tagTextColor] with a default font size.
  final TextStyle? tagTextStyle;

  /// Internal padding within each tag.
  final EdgeInsetsGeometry tagPadding;

  /// External margin around each tag.
  final EdgeInsetsGeometry tagMargin;

  /// Horizontal spacing between tags in wrap layouts.
  final double tagSpacing;

  /// Vertical spacing between tag rows in wrap layouts.
  final double tagRunSpacing;

  // Delete Icon Customization

  /// The icon used for the delete button on tags.
  final IconData deleteIcon;

  /// The color of the delete icon.
  final Color deleteIconColor;

  /// The size of the delete icon in logical pixels.
  final double deleteIconSize;

  /// Whether to show the delete icon on tags.
  ///
  /// When `false`, tags cannot be removed by clicking. They can still be
  /// removed programmatically through the notifier.
  final bool showDeleteIcon;

  // Container Customization

  /// The background color of the main container.
  final Color containerBackgroundColor;

  /// The border color of the main container.
  final Color containerBorderColor;

  /// The width of the container border in logical pixels.
  final double containerBorderWidth;

  /// The border radius of the container in logical pixels.
  final double containerBorderRadius;

  /// Internal padding of the main container.
  final EdgeInsetsGeometry containerPadding;

  /// Fixed height of the container.
  ///
  /// If null, the container height adjusts to its content.
  final double? containerHeight;

  /// Minimum height constraint for the container.
  final double? containerMinHeight;

  /// Maximum height constraint for the container.
  final double? containerMaxHeight;

  // Layout Options

  /// The layout strategy for displaying tags.
  ///
  /// See [TagInputLayout] for available options including wrap, inline, column,
  /// and various positioning options relative to the input field.
  final TagInputLayout layout;

  /// Cross-axis alignment for column layout.
  final CrossAxisAlignment crossAxisAlignment;

  /// Main axis alignment for column layout.
  final MainAxisAlignment mainAxisAlignment;

  /// Alignment for wrap layout.
  final WrapAlignment wrapAlignment;

  /// Cross-axis alignment for wrap layout.
  final WrapCrossAlignment wrapCrossAlignment;

  // Animation Configuration

  /// Duration for tag addition and removal animations.
  final Duration animationDuration;

  /// Animation curve for tag transitions.
  final Curve animationCurve;

  /// Whether to enable animations for tag operations.
  ///
  /// When `false`, tag changes happen instantly without animation.
  final bool enableAnimations;

  // Callback Functions

  /// Called whenever the tag list changes (addition or removal).
  ///
  /// Provides the current list of all tags.
  final Function(List<String>)? onTagsChanged;

  /// Called when a new tag is successfully added.
  ///
  /// Provides the tag that was added.
  final Function(String)? onTagAdded;

  /// Called when a tag is removed.
  ///
  /// Provides the tag that was removed.
  final Function(String)? onTagRemoved;

  /// Custom validation function for tags.
  ///
  /// Should return an error message string if the tag is invalid,
  /// or null if the tag is valid.
  final String? Function(String)? tagValidator;

  /// Custom builder function for tag widgets.
  ///
  /// Allows complete customization of tag appearance and behavior.
  /// Parameters: tag text, index, and delete callback function.
  final Widget Function(String, int, VoidCallback)? tagBuilder;

  // Behavior Configuration

  /// Whether the input field should automatically receive focus.
  final bool autofocus;

  /// Whether to trim whitespace from tags before adding them.
  final bool trimTags;

  /// Whether tag comparison is case-sensitive.
  ///
  /// Affects duplicate detection and tag processing.
  final bool caseSensitive;

  /// Whether pressing Enter should submit the current input as a tag.
  final bool submitOnEnter;

  /// Whether to clear the input field after successfully adding a tag.
  final bool clearInputOnSubmit;

  /// How to handle text overflow in tag labels.
  final TextOverflow tagTextOverflow;

  /// Maximum number of lines for tag text.
  ///
  /// Set to `null` for unlimited lines.
  final int? maxTagLines;

  /// Creates a new [TagField] widget.
  ///
  /// All parameters are optional and have sensible defaults for most use cases.
  ///
  /// Example:
  /// ```dart
  /// TagField(
  ///   initialTags: ['flutter', 'dart'],
  ///   maxTags: 5,
  ///   allowDuplicates: false,
  ///   hintText: 'Add technologies...',
  ///   onTagsChanged: (tags) => setState(() => _tags = tags),
  /// )
  /// ```
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

/// The state class for [TagField] that manages the widget's lifecycle and interactions.
///
/// This class handles text input, focus management, and animation controllers.
/// It uses [TickerProviderStateMixin] to support animations.
class _TagFieldState extends State<TagField> with TickerProviderStateMixin {
  /// Controller for the text input field.
  final TextEditingController _controller = TextEditingController();

  /// Focus node for the input field, either provided by widget or created internally.
  late FocusNode _focusNode;

  /// Animation controller for tag addition and removal animations.
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
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
              .toList(),
        );

      case TagInputLayout.inline:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
              .toList(),
        );

      case TagInputLayout.column:
        return Column(
          crossAxisAlignment: widget.crossAxisAlignment,
          mainAxisAlignment: widget.mainAxisAlignment,
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
              .toList(),
        );
      case TagInputLayout.insideBelow:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
              .toList(),
        );
      case TagInputLayout.outsideBelow:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
              .toList(),
        );
      case TagInputLayout.outsideAbove:
        return Wrap(
          spacing: widget.tagSpacing,
          runSpacing: widget.tagRunSpacing,
          alignment: widget.wrapAlignment,
          crossAxisAlignment: widget.wrapCrossAlignment,
          children: tags.indexed
              .map((entry) => _buildTag(entry.$2, entry.$1, notifier))
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
              child: switch (widget.layout) {
                TagInputLayout.inline => Wrap(
                    spacing: widget.tagSpacing,
                    runSpacing: widget.tagRunSpacing,
                    alignment: widget.wrapAlignment,
                    crossAxisAlignment: widget.wrapCrossAlignment,
                    children: [
                      ...notifier.tags.indexed.map(
                        (entry) => _buildTag(entry.$2, entry.$1, notifier),
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
                  ),
                _ => Column(
                    crossAxisAlignment: widget.crossAxisAlignment,
                    mainAxisAlignment: widget.mainAxisAlignment,
                    children: [
                      _buildTags(notifier.tags, notifier),
                      if (notifier.tags.isNotEmpty) const SizedBox(height: 8),
                      _buildInputField(notifier),
                    ],
                  )
              },
            ),
          );
        },
      ),
    );
  }
}
