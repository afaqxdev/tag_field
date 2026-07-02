# tag_field

<div align="center">
  
  <!-- Header with gradient background -->
  <img width="100%" height="300" src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12&height=300&section=header&text=tag_field&fontSize=90&fontColor=fff&animation=fadeIn&fontAlignY=38&desc=Highly%20customizable%20Flutter%20tags%20and%20chips%20input%20field&descAlignY=60&descAlign=50" alt="Header"/>
  
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Package-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Package"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License"/>
  <img src="https://img.shields.io/badge/pub.dev-1.0.7-blue?style=for-the-badge&logo=dart&logoColor=white" alt="pub.dev"/>
</p>

---

## 💡 Flutter Tag Field Widget

**tag_field** is a premium, feature-rich, and highly customizable Flutter package for building interactive tag/chip input fields. It provides smooth animations, custom layouts, input validation, auto-separators, and full form integration out of the box. 

Whether you are building a social networking app with `@mentions`, a blogging platform with categorization tags, or a contact selection widget, `tag_field` has you covered.

---

## ✨ Features

<div align="center">
  
  <table>
    <tr>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🎯</div>
        <h3>Interactive Tags</h3>
        <p>Add, edit, and delete tags with smooth animations and intuitive keyboard gestures.</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">📝</div>
        <h3>Form Validation</h3>
        <p>Standard <code>TagFormField</code> wrapper with support for Flutter's <code>FormState</code> validation and saving.</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">📐</div>
        <h3>Multiple Layouts</h3>
        <p>Wrap, single-line inline scrolling, and stacked column layouts to fit any responsive design.</p>
      </td>
    </tr>
    <tr>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🎨</div>
        <h3>Full Customization</h3>
        <p>Customize colors, gradients, borders, shadows, icons, and text styles to match your design system.</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">✅</div>
        <h3>Smart Validation</h3>
        <p>Enforce tag limit boundaries, validate tag formats, and prevent duplicate tag entries.</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🛠️</div>
        <h3>Custom Builders</h3>
        <p>Provide a <code>tagBuilder</code> callback to render entirely custom widget interfaces for individual tags.</p>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center">
        <div style="font-size: 64px; margin-bottom: 10px;">📌</div>
        <h3>Flexible Suggestion Positioning</h3>
        <p>Supports positioning tags <code>insideBelow</code>, <code>outsideAbove</code>, and <code>outsideBelow</code> relative to the text entry field.</p>
      </td>
    </tr>
  </table>
  
</div>

---

## 🎬 Demo

<div align="center">
  
  <img src="https://raw.githubusercontent.com/afaqxdev/tag_field/main/example/assets/demo.gif" alt="Flutter Tag Field Demo" width="400" style="border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.3);"/>
  
  <p><em>Check out how the animations and layouts adapt elegantly in real-time! ✨</em></p>
  
</div>

---

## 🚀 Quick Start

### Installation

Add `tag_field` to your project's `pubspec.yaml` file:

```yaml
dependencies:
  tag_field: ^1.0.7
```

Import it in your Dart file:

```dart
import 'package:tag_field/tag_field.dart';
```

---

## 💻 Code Examples

### 1. Basic TagField Usage

A simple tagging interface with custom separators and duplicate detection:

```dart
TagField(
  initialTags: const ['Flutter', 'Dart'],
  hintText: 'Add programming languages...',
  maxTags: 8,
  allowDuplicates: false,
  separators: const [' ', ',', '\n'],
  onTagsChanged: (tags) {
    print('Current tags: $tags');
  },
)
```

### 2. Form Validation (`TagFormField`)

Integrate tag inputs inside your forms seamlessly. Supports validators, resetting, and custom error decorations:

```dart
Form(
  key: _formKey,
  child: Column(
    children: [
      TagFormField(
        initialValue: const ['Flutter'],
        hintText: 'Add at least 2 tags...',
        validator: (tags) {
          if (tags == null || tags.length < 2) {
            return 'Please add at least 2 tags to continue';
          }
          return null;
        },
        onSaved: (tags) {
          _myModel.tags = tags ?? [];
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: const Text('Submit'),
      ),
    ],
  ),
)
```

### 3. Suggestions Overlay (Auto-Complete)

Provide a list of suggestions that automatically filter as the user types:

```dart
TagField(
  suggestions: const ['apple', 'banana', 'apricot', 'cherry'],
  hintText: 'Type to search fruits...',
  onTagsChanged: (tags) {
    print('Selected tags: $tags');
  },
)
```

### 4. Input Formatting & Character Limits

Apply custom input formatting constraints (e.g. alphanumeric only) and limit the length of individual tags:

```dart
TagField(
  maxTagLength: 10,
  inputFormatters: [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')), // Alphanumeric only
  ],
  hintText: 'Max 10 chars, letters/numbers only...',
)
```

---

## ⚙️ Configuration Properties

The `TagField` and `TagFormField` widgets accept the following configuration parameters:

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `initialTags`/`initialValue` | `List<String>` | `const []` | Initial tags list to seed the input field. |
| `maxTags` | `int?` | `null` | Maximum allowed tags limit boundary. |
| `allowDuplicates` | `bool` | `false` | When false, shows snack bar error when duplicate tags are entered. |
| `hintText` | `String` | `'Add tags...'` | Placeholder text inside text field when empty. |
| `layout` | `TagInputLayout` | `TagInputLayout.wrap` | Layout strategy (`wrap`, `inline`, `column`, `insideBelow`, `outsideAbove`, `outsideBelow`). |
| `separators` | `List<String>` | `const [' ', ',', '\n']` | Characters that trigger tag addition when typed. |
| `submitOnEnter` | `bool` | `true` | Convert input to tag when pressing Enter. |
| `clearInputOnSubmit` | `bool` | `true` | Instantly clear the text field upon tag addition. |
| `trimTags` | `bool` | `true` | Trim whitespace characters before tag creation. |
| `caseSensitive` | `bool` | `false` | Enforce case-sensitive comparison on tag deduplication. |
| `enableAnimations` | `bool` | `true` | Toggle animation transitions. |
| `tagBuilder` | `Widget Function(...)` | `null` | Custom builder to supply custom UI layout widgets for tags. |
| `tagBackgroundColor` | `Color` | `Color(0xFFE3F2FD)` | Background color of individual tags. |
| `tagTextColor` | `Color` | `Color(0xFF1976D2)` | Font color of individual tag texts. |
| `tagBorderColor` | `Color` | `Color(0xFF90CAF9)` | Border outline color of individual tags. |
| `containerBorderColor` | `Color` | `Color(0xFFE0E0E0)` | Outer border color of the input container. |
| `suggestions` | `List<String>?` | `null` | Predefined list of suggestions for the auto-complete overlay dropdown. |
| `suggestionBuilder` | `Widget Function(...)` | `null` | Custom builder to render suggestion overlay items. |
| `suggestionMaxHeight` | `double` | `200.0` | Maximum height of the suggestion overlay panel. |
| `suggestionBackgroundColor` | `Color?` | `null` | Background color of the suggestions dropdown container. |
| `inputFormatters` | `List<TextInputFormatter>?` | `null` | Input formatting rules for character constraints. |
| `maxTagLength` | `int?` | `null` | Character length boundary for any single tag. |

---

## 👥 Meet The Creators

<div align="center">
  
  <img src="https://capsule-render.vercel.app/api?type=rounded&color=gradient&customColorList=6&height=150&section=header&text=Meet%20The%20Creators&fontSize=50&fontColor=fff&animation=blinking" alt="Team Header"/>
  
  <br/><br/>
  
  <table>
    <tr>
      <td align="center" width="250">
        <div>
          <img src="https://github.com/afaqxdev.png" 
               width="120" 
               height="120" 
               style="border-radius: 50%; border: 4px solid #667eea; box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);" 
               alt="afaqxdev"/>
          <br/><br/>
          <strong style="font-size: 18px;">🎯 Afaq Zahir</strong>
          <br/>
          <sub style="color: #667eea; font-weight: bold;">Lead Developer & Architect</sub>
          <br/><br/>
          <a href="https://github.com/afaqxdev">
            <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:afaqxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </div>
      </td>
      <td align="center" width="250">
        <div>
          <img src="https://github.com/ubaidxdev.png" 
               width="120" 
               height="120" 
               style="border-radius: 50%; border: 4px solid #f093fb; box-shadow: 0 10px 25px rgba(240, 147, 251, 0.4);" 
               alt="ubaidxdev"/>
          <br/><br/>
          <strong style="font-size: 18px;">⚡ Ubaid Ullah </strong>
          <br/>
          <sub style="color: #f093fb; font-weight: bold;">Flutter Expert & Innovator</sub>
          <br/><br/>
          <a href="https://github.com/ubaidxdev">
            <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:ubaidxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </div>
      </td>
      <td align="center" width="250">
        <div>
          <img src="https://github.com/uzairxdev.png" 
               width="120" 
               height="120" 
               style="border-radius: 50%; border: 4px solid #4facfe; box-shadow: 0 10px 25px rgba(79, 172, 254, 0.4);" 
               alt="uzairxdev"/>
          <br/><br/>
          <strong style="font-size: 18px;">🚀 Muhammad Uzair</strong>
          <br/>
          <sub style="color: #4facfe; font-weight: bold;">Flutter Expert & Innovator</sub>
          <br/><br/>
          <a href="https://github.com/uzairxdev">
            <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:uzairxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </div>
      </td>
      <td align="center" width="250">
        <div>
          <img src="https://avatars.githubusercontent.com/u/66121828?v=4" 
               width="120" 
               height="120" 
               style="border-radius: 50%; border: 4px solid #4facfe; box-shadow: 0 10px 25px rgba(79, 172, 254, 0.4);" 
               alt="uzairxdev"/>
          <br/><br/>
          <strong style="font-size: 18px;">🚀 Munsif Ali</strong>
          <br/>
          <sub style="color: #4facfe; font-weight: bold;">Flutter Guru</sub>
          <br/><br/>
          <a href="https://github.com/Munsif-Ali">
            <img src="https://img.shields.io/badge/-GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:munsifalitaj@gmail.com">
            <img src="https://img.shields.io/badge/-Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </div>
      </td>
    </tr>
  </table>

  <br/>

  <!-- Stats badges section -->
  <div>
    <img src="https://img.shields.io/badge/Team%20Members-4-blueviolet?style=for-the-badge&logo=users&logoColor=white" alt="Team"/>
    <img src="https://img.shields.io/badge/Flutter-Experts-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
    <img src="https://img.shields.io/badge/Open%20Source-❤️-red?style=for-the-badge&logo=heart&logoColor=white" alt="Open Source"/>
    <img src="https://img.shields.io/badge/Made%20with-☕-brown?style=for-the-badge&logo=coffee&logoColor=white" alt="Coffee"/>
  </div>

  <br/>

  <!-- Contact card -->
  <div style="background: linear-gradient(45deg, #667eea, #764ba2); padding: 20px; border-radius: 15px; margin: 20px;">
    <h2 style="color: white; margin: 0 0 10px 0;">🤝 Let's Build Something Amazing Together!</h2>
    <p style="color: white; font-size: 16px; margin: 0;">
      <strong>Passionate Flutter developers creating the future, one widget at a time</strong>
      <br/>
      <em>💬 Got questions? Ideas? Just want to say hi? We'd love to hear from you!</em>
    </p>
  </div>

</div>

<!-- Footer waving header -->
<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12&height=200&section=footer&animation=fadeIn" alt="Footer"/>
</div>

---

<div align="center">
  <sub>Built with ❤️ by the tag_field team | © 2026</sub>
</div>
