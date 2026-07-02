import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tag_field/tag_field.dart';

/// A [FormField] wrapper for [TagField], allowing it to be used within a [Form] widget.
///
/// This widget integrates tag input with Flutter's form validation and lifecycle management.
class TagFormField extends FormField<List<String>> {
  /// Creates a [TagFormField] that wraps a [TagField].
  TagFormField({
    super.key,
    super.onSaved,
    super.validator,
    List<String> initialValue = const [],
    super.enabled = true,
    super.autovalidateMode,
    
    // TagField properties
    String hintText = 'Add tags...',
    TextStyle? inputTextStyle,
    InputDecoration? inputDecoration,
    FocusNode? focusNode,
    TextInputAction textInputAction = TextInputAction.done,
    List<String> separators = const [' ', ',', '\n'],
    Color tagBackgroundColor = const Color(0xFFE3F2FD),
    Color tagTextColor = const Color(0xFF1976D2),
    Color tagBorderColor = const Color(0xFF90CAF9),
    double tagBorderWidth = 1.0,
    double tagBorderRadius = 16.0,
    TextStyle? tagTextStyle,
    EdgeInsetsGeometry tagPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    EdgeInsetsGeometry tagMargin = const EdgeInsets.only(right: 6, bottom: 6),
    double tagSpacing = 6.0,
    double tagRunSpacing = 6.0,
    IconData deleteIcon = Icons.close,
    Color deleteIconColor = const Color(0xFF666666),
    double deleteIconSize = 16.0,
    bool showDeleteIcon = true,
    Color containerBackgroundColor = Colors.transparent,
    Color containerBorderColor = const Color(0xFFE0E0E0),
    double containerBorderWidth = 1.0,
    double containerBorderRadius = 8.0,
    EdgeInsetsGeometry containerPadding = const EdgeInsets.all(8.0),
    double? containerHeight,
    double? containerMinHeight,
    double? containerMaxHeight,
    TagInputLayout layout = TagInputLayout.wrap,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    WrapAlignment wrapAlignment = WrapAlignment.start,
    WrapCrossAlignment wrapCrossAlignment = WrapCrossAlignment.start,
    Duration animationDuration = const Duration(milliseconds: 200),
    Curve animationCurve = Curves.easeInOut,
    bool enableAnimations = true,
    Function(List<String>)? onTagsChanged,
    Function(String)? onTagAdded,
    Function(String)? onTagRemoved,
    String? Function(String)? tagValidator,
    Widget Function(String, int, VoidCallback)? tagBuilder,
    bool autofocus = false,
    bool trimTags = true,
    bool caseSensitive = false,
    bool submitOnEnter = true,
    bool clearInputOnSubmit = true,
    TextOverflow tagTextOverflow = TextOverflow.ellipsis,
    int? maxTagLines = 1,
    int? maxTags,
    bool allowDuplicates = false,
    List<String>? suggestions,
    Widget Function(BuildContext context, String suggestion, VoidCallback onTap)? suggestionBuilder,
    double suggestionMaxHeight = 200.0,
    Color? suggestionBackgroundColor,
    List<TextInputFormatter>? inputFormatters,
    int? maxTagLength,
  }) : super(
          initialValue: initialValue,
          builder: (FormFieldState<List<String>> state) {
            final theme = Theme.of(state.context);
            
            // Customize container border if there is an error
            final borderDecorationColor = state.hasError
                ? theme.colorScheme.error
                : containerBorderColor;
                
            return UnmanagedRestorationScope(
              bucket: state.bucket,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TagField(
                    initialTags: state.value ?? [],
                    maxTags: maxTags,
                    allowDuplicates: allowDuplicates,
                    hintText: hintText,
                    inputTextStyle: inputTextStyle,
                    inputDecoration: inputDecoration,
                    enabled: enabled,
                    focusNode: focusNode,
                    textInputAction: textInputAction,
                    separators: separators,
                    tagBackgroundColor: tagBackgroundColor,
                    tagTextColor: tagTextColor,
                    tagBorderColor: tagBorderColor,
                    tagBorderWidth: tagBorderWidth,
                    tagBorderRadius: tagBorderRadius,
                    tagTextStyle: tagTextStyle,
                    tagPadding: tagPadding,
                    tagMargin: tagMargin,
                    tagSpacing: tagSpacing,
                    tagRunSpacing: tagRunSpacing,
                    deleteIcon: deleteIcon,
                    deleteIconColor: deleteIconColor,
                    deleteIconSize: deleteIconSize,
                    showDeleteIcon: showDeleteIcon,
                    containerBackgroundColor: containerBackgroundColor,
                    containerBorderColor: borderDecorationColor,
                    containerBorderWidth: containerBorderWidth,
                    containerBorderRadius: containerBorderRadius,
                    containerPadding: containerPadding,
                    containerHeight: containerHeight,
                    containerMinHeight: containerMinHeight,
                    containerMaxHeight: containerMaxHeight,
                    layout: layout,
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    wrapAlignment: wrapAlignment,
                    wrapCrossAlignment: wrapCrossAlignment,
                    animationDuration: animationDuration,
                    animationCurve: animationCurve,
                    enableAnimations: enableAnimations,
                    onTagsChanged: (tags) {
                      state.didChange(tags);
                      onTagsChanged?.call(tags);
                    },
                    onTagAdded: onTagAdded,
                    onTagRemoved: onTagRemoved,
                    tagValidator: tagValidator,
                    tagBuilder: tagBuilder,
                    autofocus: autofocus,
                    trimTags: trimTags,
                    caseSensitive: caseSensitive,
                    submitOnEnter: submitOnEnter,
                    clearInputOnSubmit: clearInputOnSubmit,
                    tagTextOverflow: tagTextOverflow,
                    maxTagLines: maxTagLines,
                    suggestions: suggestions,
                    suggestionBuilder: suggestionBuilder,
                    suggestionMaxHeight: suggestionMaxHeight,
                    suggestionBackgroundColor: suggestionBackgroundColor,
                    inputFormatters: inputFormatters,
                    maxTagLength: maxTagLength,
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                      child: Text(
                        state.errorText ?? '',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
}
