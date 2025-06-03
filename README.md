# tag_field

A highly customizable Flutter widget for entering and displaying tags.  
Supports multiple layouts, custom styles, validation, and animated tag input.

---

## Features

- Add and delete tags interactively  
- Support for inline and column layouts  
- Customizable tag colors, borders, padding, and delete icons  
- Input validation and separators support  
- Optional animations for tag addition/removal  
- Custom tag builders for fully tailored UI  

---


## Demo

Here is a quick demo of how the tag_field package works:

![TagField Demo](https://raw.githubusercontent.com/afaqxdev/tag_field/main/example/assets/demo.gif)

## Usage

Import the package and use the `TagField` widget like this:

```dart
TagField(
  initialTags: skillTags,
  tagBackgroundColor: Colors.purple.shade100,
  tagTextColor: Colors.purple.shade800,
  tagBorderColor: Colors.purple.shade300,
  deleteIconColor: Colors.purple.shade600,
  containerBorderColor: Colors.purple.shade200,
  containerBorderRadius: 12,
  tagBorderRadius: 8,
  hintText: 'Add your skills...',
  separators: const [' ', ',', ';'],
  onTagsChanged: (tags) => setState(() => skillTags = tags),
)
```

## Installation

Add the latest version of `tag_field` to your `pubspec.yaml` dependencies:

```yaml
dependencies:
  tag_field: ^latest_version
````



## 👥 Collaborators

<p float="left">
  <a href="https://github.com/afaqxdev">
    <img src="https://github.com/afaqxdev.png" width="48" height="48" style="border-radius:50%" alt="afaqxdev"/>
  </a>
  <a href="https://github.com/someone">
    <img src="https://github.com/ubaidxdev.png" width="48" height="48" style="border-radius:50%" alt="ubaidxdev"/>
  </a>
</p>
