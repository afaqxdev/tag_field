# CustomTextFieldTags Flutter Widget

A customizable Flutter widget that allows users to input multiple tags using a `TextField`. It supports both traditional tag input and inline tag-style editing — just like in Gmail or Trello.

## ✨ Features

- Add tags by typing and pressing **space**, **comma**, or **enter**
- Customizable tag styles (colors, borders, radius, etc.)
- Realtime callbacks when tags are added or removed
- Option to limit the number of tags
- Optional tag validation
- Two modes:
  - 🧱 Classic style (tags displayed above/below the `TextField`)
  - ✨ Inline style (tags inside the input area)

## 📦 Installation

Add this widget directly into your project. No external dependencies needed.

## 🚀 Usage

### Classic Example

```dart
CustomTextFieldTags(
  initialTags: ['Flutter', 'Dart'],
  hintText: 'Type and press space or comma...',
  maxTags: 10,
  separators: [' ', ',', '\n'],
  tagBackgroundColor: Colors.green.shade100,
  tagBorderColor: Colors.green.shade300,
  tagTextStyle: TextStyle(
    color: Colors.green.shade800,
    fontWeight: FontWeight.w500,
  ),
  deleteIconColor: Colors.green.shade600,
  onTagsChanged: (newTags) {
    print('Tags updated: $newTags');
  },
)
