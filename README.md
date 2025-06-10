# tag_field

<div align="center">
  
  <!-- Cool Header with gradient background -->
  <img width="100%" height="300" src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12&height=300&section=header&text=tag_field&fontSize=90&fontColor=fff&animation=fadeIn&fontAlignY=38&desc=Highly%20customizable%20Flutter%20package%20for%20tags&descAlignY=60&descAlign=50" alt="Header"/>
  
</div>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Package-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Package"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License"/>
  <img src="https://img.shields.io/badge/pub.dev-1.0.0-blue?style=for-the-badge&logo=dart&logoColor=white" alt="pub.dev"/>
</p>

---

## ✨ Features

<div align="center">
  
  <table>
    <tr>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🎯</div>
        <h3>Interactive Tags</h3>
        <p>Add and delete tags with smooth animations and intuitive gestures</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">📐</div>
        <h3>Multiple Layouts</h3>
        <p>Support for inline and column layouts to fit your design needs</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🎨</div>
        <h3>Full Customization</h3>
        <p>Colors, borders, padding, icons - make it uniquely yours</p>
      </td>
    </tr>
    <tr>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">✅</div>
        <h3>Smart Validation</h3>
        <p>Built-in input validation and separator support</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">⚡</div>
        <h3>Smooth Animations</h3>
        <p>Optional animations for tag addition and removal</p>
      </td>
      <td align="center" width="300">
        <div style="font-size: 64px; margin-bottom: 10px;">🛠️</div>
        <h3>Custom Builders</h3>
        <p>Build completely custom tag UIs with flexible builders</p>
      </td>
    </tr>
    <td colspan="3" align="center"> <div style="font-size: 64px; margin-bottom: 10px;">📌</div> <h3>Flexible Suggestion Positioning</h3> <p>Now supports <code>insideBelow</code>, <code>outsideAbove</code>, and <code>outsideBelow</code> tag suggestion positions</p> </td>
  </table>
  
</div>

---

## 🎬 Demo

<div align="center">
  
  <img src="https://raw.githubusercontent.com/afaqxdev/tag_field/main/example/assets/demo.gif" alt="TagField Demo" width="400" style="border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.3);"/>
  
  <p><em>See tag_field in action! ✨</em></p>
  
</div>

---

## 🚀 Quick Start

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  tag_field: ^latest_version
```

### Usage

```dart
import 'package:tag_field/tag_field.dart';

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

---

## 👥 Our Amazing Team

<div align="center">
  
  <!-- Cool team header -->
  <img src="https://capsule-render.vercel.app/api?type=rounded&color=gradient&customColorList=6&height=150&section=header&text=Meet%20The%20Creators&fontSize=50&fontColor=fff&animation=blinking" alt="Team Header"/>
  
  <br/><br/>
  
  <!-- Team members with cool cards -->
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
    </tr>
  </table>

  <br/>

  <!-- Cool stats section -->
  <div>
    <img src="https://img.shields.io/badge/Team%20Members-3-blueviolet?style=for-the-badge&logo=users&logoColor=white" alt="Team"/>
    <img src="https://img.shields.io/badge/Flutter-Experts-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
    <img src="https://img.shields.io/badge/Open%20Source-❤️-red?style=for-the-badge&logo=heart&logoColor=white" alt="Open Source"/>
    <img src="https://img.shields.io/badge/Made%20with-☕-brown?style=for-the-badge&logo=coffee&logoColor=white" alt="Coffee"/>
  </div>

  <br/>

  <!-- Contact section with cool styling -->
  <div style="background: linear-gradient(45deg, #667eea, #764ba2); padding: 20px; border-radius: 15px; margin: 20px;">
    <h2 style="color: white;">🤝 Let's Build Something Amazing Together!</h2>
    <p style="color: white; font-size: 16px;">
      <strong>Passionate Flutter developers creating the future, one widget at a time</strong>
      <br/>
      <em>💬 Got questions? Ideas? Just want to say hi? We'd love to hear from you!</em>
    </p>
  </div>

</div>

<!-- Cool footer -->
<div align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=12&height=200&section=footer&animation=fadeIn" alt="Footer"/>
</div>

---

<div align="center">
  <sub>Built with ❤️ by the tag_field team | © 2024</sub>
</div>
