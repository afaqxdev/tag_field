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

<div align="center">
  
  <!-- Simple but attractive header -->
  <h1>🚀 Meet Our Amazing Team</h1>
  <p><em>Building Flutter Magic Together!</em></p>
  
  <br/>
  
  <!-- Team Members in a clean layout -->
  <table>
    <tr>
      <td align="center" width="200">
        <a href="https://github.com/afaqxdev">
          <img src="https://github.com/afaqxdev.png" 
               width="100" 
               height="100" 
               style="border-radius: 50%;" 
               alt="afaqxdev"/>
          <br/>
          <br/>
          <strong>🎯 Afaq Ahmed</strong>
          <br/>
          <sub>Lead Developer</sub>
          <br/>
          <a href="https://github.com/afaqxdev">
            <img src="https://img.shields.io/badge/-@afaqxdev-blue?style=flat-square&logo=github" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:afaqxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Email-blue?style=flat-square&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </a>
      </td>
      <td align="center" width="200">
        <a href="https://github.com/ubaidxdev">
          <img src="https://github.com/ubaidxdev.png" 
               width="100" 
               height="100" 
               style="border-radius: 50%;" 
               alt="ubaidxdev"/>
          <br/>
          <br/>
          <strong>⚡ Ubaid Ahmed</strong>
          <br/>
          <sub>Flutter Expert</sub>
          <br/>
          <a href="https://github.com/ubaidxdev">
            <img src="https://img.shields.io/badge/-@ubaidxdev-red?style=flat-square&logo=github" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:ubaidxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Email-red?style=flat-square&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </a>
      </td>
      <td align="center" width="200">
        <a href="https://github.com/uzairxdev">
          <img src="https://github.com/uzairxdev.png" 
               width="100" 
               height="100" 
               style="border-radius: 50%;" 
               alt="uzairxdev"/>
          <br/>
          <br/>
          <strong>🚀 Uzair Ahmed</strong>
          <br/>
          <sub>UI/UX Designer</sub>
          <br/>
          <a href="https://github.com/uzairxdev">
            <img src="https://img.shields.io/badge/-@uzairxdev-green?style=flat-square&logo=github" alt="GitHub"/>
          </a>
          <br/>
          <a href="mailto:uzairxdev@gmail.com">
            <img src="https://img.shields.io/badge/-Email-green?style=flat-square&logo=gmail&logoColor=white" alt="Email"/>
          </a>
        </a>
      </td>
    </tr>
  </table>

  <br/>

  <!-- Team Stats -->
  <div>
    <img src="https://img.shields.io/badge/Team_Members-3-blue?style=for-the-badge&logo=users" alt="Team Members"/>
    <img src="https://img.shields.io/badge/Flutter-Experts-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
    <img src="https://img.shields.io/badge/Open_Source-❤️-red?style=for-the-badge" alt="Open Source"/>
  </div>

  <br/>

  <!-- Contact Message -->
  <div>
    <h3>🤝 Let's Connect & Build Together!</h3>
    <p>
      <strong>Passionate Flutter developers creating amazing experiences</strong>
      <br/>
      <em>Feel free to reach out for collaborations, questions, or just to say hi! 👋</em>
    </p>
  </div>

</div>

---
