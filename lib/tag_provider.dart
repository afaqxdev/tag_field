import 'package:flutter/material.dart';
import 'package:tag_field/tag_field.dart';

class TagInputNotifier extends ChangeNotifier {
  List<String> _tags = [];
  List<String> get tags => _tags;

  final TagField widget;

  TagInputNotifier(this.widget) {
    _tags = List.from(widget.initialTags);
  }

  String _processTag(String tag) {
    String processed = widget.trimTags ? tag.trim() : tag;
    if (!widget.caseSensitive) {
      processed = processed.toLowerCase();
    }
    return processed;
  }

  bool _isDuplicate(String tag) {
    String processedTag = _processTag(tag);
    return _tags.any((existingTag) => _processTag(existingTag) == processedTag);
  }

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

  void removeTag(int index) {
    if (index < 0 || index >= _tags.length) return;

    final removedTag = _tags[index];
    _tags.removeAt(index);
    notifyListeners();

    widget.onTagRemoved?.call(removedTag);
    widget.onTagsChanged?.call(_tags);
  }
}

enum TagInputLayout {
  wrap, // Tags wrap into multiple lines
  inline, // Tags flow inline with the input
  column, // Tags stack vertically in a column
  insideBelow, // Suggestion/tags shown inside input field area, below the input
  outsideAbove, // Suggestion/tags shown outside and above the input field
  outsideBelow, // Suggestion/tags shown outside and below the input field
}
