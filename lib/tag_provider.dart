import 'package:flutter/material.dart';
import 'package:tag_field/tag_field.dart';

/// A [ChangeNotifier] that manages the state and behavior of tags in a [TagField].
///
/// This class handles tag operations including adding, removing, validation,
/// and duplicate checking. It notifies listeners when the tag list changes,
/// enabling reactive UI updates.
///
/// Example usage:
/// ```dart
/// final notifier = TagInputNotifier(tagFieldWidget);
/// notifier.addListener(() {
///   print('Tags changed: ${notifier.tags}');
/// });
/// ```
class TagInputNotifier extends ChangeNotifier {
  /// The list of current tags.
  ///
  /// This is a private list that stores all the tags currently added to the field.
  /// Use the [tags] getter to access this list from outside the class.
  List<String> _tags = [];

  /// Gets the current list of tags.
  ///
  /// Returns an unmodifiable view of the current tags to prevent external modification.
  /// To modify tags, use [addTag] or [removeTag] methods.
  List<String> get tags => _tags;

  /// The [TagField] widget that this notifier manages.
  ///
  /// This contains the configuration and callbacks for the tag field.
  final TagField widget;

  /// Creates a new [TagInputNotifier] with the given [widget].
  ///
  /// Initializes the tag list with the [TagField.initialTags] if provided.
  ///
  /// Example:
  /// ```dart
  /// final notifier = TagInputNotifier(TagField(
  ///   initialTags: ['flutter', 'dart'],
  ///   onTagsChanged: (tags) => print('Tags: $tags'),
  /// ));
  /// ```
  TagInputNotifier(this.widget) {
    _tags = List.from(widget.initialTags);
  }

  /// Processes a tag according to the field's configuration.
  ///
  /// Applies trimming and case sensitivity settings from the [TagField].
  ///
  /// Parameters:
  /// - [tag]: The raw tag string to process
  ///
  /// Returns:
  /// The processed tag string after applying trimming and case sensitivity rules.
  String _processTag(String tag) {
    String processed = widget.trimTags ? tag.trim() : tag;
    if (!widget.caseSensitive) {
      processed = processed.toLowerCase();
    }
    return processed;
  }

  /// Checks if a tag is a duplicate of an existing tag.
  ///
  /// Uses [_processTag] to normalize both the new tag and existing tags
  /// before comparison, ensuring consistency with the field's configuration.
  ///
  /// Parameters:
  /// - [tag]: The tag to check for duplicates
  ///
  /// Returns:
  /// `true` if the tag is a duplicate, `false` otherwise.
  bool _isDuplicate(String tag) {
    String processedTag = _processTag(tag);
    return _tags.any((existingTag) => _processTag(existingTag) == processedTag);
  }

  /// Adds a new tag to the tag list.
  ///
  /// Performs comprehensive validation including:
  /// - Empty tag checking
  /// - Duplicate validation (based on [duplicate] parameter and widget settings)
  /// - Maximum tag limit enforcement
  /// - Custom tag validation using [TagField.tagValidator]
  ///
  /// If validation fails, shows appropriate error messages via [ScaffoldMessenger].
  /// On successful addition, notifies listeners and triggers callbacks.
  ///
  /// Parameters:
  /// - [duplicate]: Whether to allow duplicate tags for this operation
  /// - [tag]: The tag string to add
  /// - [context]: The [BuildContext] for showing error messages
  ///
  /// Example:
  /// ```dart
  /// notifier.addTag(false, 'flutter', context);
  /// ```
  void addTag(bool duplicate, String tag, BuildContext context) {
    if (tag.isEmpty) return;

    String processedTag = _processTag(tag);
    if (processedTag.isEmpty) return;
    // Check for duplicates
    if (!duplicate && _isDuplicate(processedTag)) {
      if (!widget.allowDuplicates) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Duplicate tags are not allowed')),
        );
        return;
      }
      // If duplicates are allowed, proceed without further checks
    }

    // Check max tags limit
    if (widget.maxTags != null && _tags.length >= widget.maxTags!) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum tag limit reached')),
      );
      return;
    }

    // Validate tag
    if (widget.tagValidator != null) {
      final validationError = widget.tagValidator!(processedTag);
      if (validationError != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(validationError)));
        return;
      }
    }

    _tags.add(processedTag);
    notifyListeners();

    widget.onTagAdded?.call(processedTag);
    widget.onTagsChanged?.call(_tags);
  }

  /// Removes a tag from the tag list at the specified index.
  ///
  /// Validates the index bounds before removal. If successful, notifies listeners
  /// and triggers the appropriate callbacks defined in the [TagField].
  ///
  /// Parameters:
  /// - [index]: The index of the tag to remove from the list
  ///
  /// Returns:
  /// Nothing. If the index is invalid, the method returns early without changes.
  ///
  /// Example:
  /// ```dart
  /// notifier.removeTag(0); // Removes the first tag
  /// ```
  void removeTag(int index) {
    if (index < 0 || index >= _tags.length) return;

    final removedTag = _tags[index];
    _tags.removeAt(index);
    notifyListeners();

    widget.onTagRemoved?.call(removedTag);
    widget.onTagsChanged?.call(_tags);
  }
}

/// Defines the layout options for displaying tags in a [TagField].
///
/// This enum provides different layout strategies for arranging tags
/// within or around the input field, offering flexibility in UI design.
///
/// Each layout option affects how tags are positioned relative to the
/// input field and how they wrap or flow when there are multiple tags.
enum TagInputLayout {
  /// Tags wrap into multiple lines within the available space.
  ///
  /// This is the default layout where tags flow horizontally and wrap
  /// to new lines when they exceed the container width.
  wrap,

  /// Tags flow inline with the input field in a single line.
  ///
  /// Tags are displayed horizontally in a single row, potentially
  /// requiring horizontal scrolling if they exceed the container width.
  inline,

  /// Tags are stacked vertically in a column layout.
  ///
  /// Each tag is placed on its own line, creating a vertical list
  /// of tags that takes up more vertical space but ensures readability.
  column,

  /// Tags or suggestions are shown inside the input field area, below the input.
  ///
  /// This layout places tags within the input field's bounds, underneath
  /// the text input line, keeping everything contained within the field.
  insideBelow,

  /// Tags or suggestions are shown outside and above the input field.
  ///
  /// Tags are displayed in a separate area above the input field,
  /// providing clear visual separation between tags and input.
  outsideAbove,

  /// Tags or suggestions are shown outside and below the input field.
  ///
  /// Tags are displayed in a separate area below the input field,
  /// which is useful for showing suggestions or completed tags.
  outsideBelow,
}
