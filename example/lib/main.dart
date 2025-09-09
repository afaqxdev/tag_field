import 'package:flutter/material.dart';
import 'package:tag_field/tag_field.dart';
import 'package:tag_field/tag_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Tag Input Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const TagInputExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TagInputExample extends StatefulWidget {
  const TagInputExample({super.key});

  @override
  State<TagInputExample> createState() => _TagInputExampleState();
}

class _TagInputExampleState extends State<TagInputExample> {
  List<String> programmingTags = ['Flutter', 'Dart'];
  List<String> skillTags = ['Problem Solving'];
  List<String> colorTags = ['Blue', 'Red'];
  List<String> hobbiesTags = [];
  List<String> languageTags = ['English'];
  List<String> projectTags = ['Mobile App'];
  List<String> socialTags = ['@flutter'];
  List<String> locationTags = ['New York'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customizable Tag Input Examples'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Default Blue Theme
            _buildSectionTitle('1. Default Style (Blue Theme)'),
            TagField(
              initialTags: programmingTags,
              hintText: 'Add programming languages...',
              maxTags: 8,
              onTagsChanged: (tags) => setState(() => programmingTags = tags),
            ),

            const SizedBox(height: 24),

            // Example 2: Purple Material Design
            _buildSectionTitle('2. Material Purple Theme'),
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
            ),

            const SizedBox(height: 24),

            // Example 3: Inline Gmail Style
            _buildSectionTitle('3. Gmail-Style Inline Tags'),
            TagField(
              initialTags: colorTags,
              layout: TagInputLayout.inline,
              tagBackgroundColor: Colors.green.shade100,
              tagTextColor: Colors.green.shade800,
              tagBorderColor: Colors.green.shade300,
              tagBorderRadius: 20,
              containerPadding: const EdgeInsets.all(12),
              hintText: 'Add tags...',
              onTagsChanged: (tags) => setState(() => colorTags = tags),
            ),

            const SizedBox(height: 24),

            // Example 4: Dark Theme with Neon Colors
            _buildSectionTitle('4. Dark Theme with Neon Accent'),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: TagField(
                initialTags: hobbiesTags,
                tagBackgroundColor: Colors.cyan.shade400,
                tagTextColor: Colors.grey.shade900,
                tagBorderColor: Colors.cyan.shade300,
                containerBackgroundColor: Colors.grey.shade800,
                containerBorderColor: Colors.grey.shade600,
                deleteIconColor: Colors.grey.shade800,
                inputTextStyle: const TextStyle(color: Colors.white),
                tagTextStyle: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
                hintText: 'Add hobbies...',
                inputDecoration: const InputDecoration(
                  hintText: 'Type your hobbies...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onTagsChanged: (tags) => setState(() => hobbiesTags = tags),
              ),
            ),

            const SizedBox(height: 24),

            // Example 5: Chip Style (No Borders)
            _buildSectionTitle('5. Modern Chip Style (Borderless)'),
            TagField(
              initialTags: languageTags,
              tagBackgroundColor: Colors.orange.shade100,
              tagTextColor: Colors.orange.shade800,
              tagBorderColor: Colors.transparent,
              tagBorderWidth: 0,
              tagBorderRadius: 25,
              tagPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              containerBorderColor: Colors.orange.shade200,
              deleteIcon: Icons.close_rounded,
              deleteIconSize: 18,
              hintText: 'Languages you speak...',
              onTagsChanged: (tags) => setState(() => languageTags = tags),
            ),

            const SizedBox(height: 24),

            // Example 6: Square Tags with Custom Icons
            _buildSectionTitle('6. Square Tags with Custom Delete Icon'),
            TagField(
              initialTags: projectTags,
              tagBackgroundColor: Colors.indigo.shade50,
              tagTextColor: Colors.indigo.shade700,
              tagBorderColor: Colors.indigo.shade200,
              tagBorderRadius: 4, // Square corners
              deleteIcon: Icons.remove_circle,
              deleteIconColor: Colors.red.shade400,
              tagPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              containerBorderRadius: 4,
              hintText: 'Project names...',
              maxTags: 5,
              onTagsChanged: (tags) => setState(() => projectTags = tags),
              onTagAdded: (tag) => debugPrint('Added project: $tag'),
            ),

            const SizedBox(height: 24),

            // Example 7: Social Media Style with @ prefix
            _buildSectionTitle('7. Social Media Style (@mentions)'),
            TagField(
              initialTags: socialTags,
              layout: TagInputLayout.inline,
              tagBackgroundColor: Colors.blue.shade600,
              tagTextColor: Colors.white,
              tagBorderColor: Colors.blue.shade700,
              tagBorderRadius: 16,
              containerBorderColor: Colors.blue.shade300,
              deleteIconColor: Colors.white70,
              hintText: 'Add @username...',
              separators: const [' ', ','],
              tagValidator: (tag) {
                if (!tag.startsWith('@')) {
                  return 'Tag must start with @';
                }
                return null;
              },
              onTagsChanged: (tags) => setState(() => socialTags = tags),
            ),

            const SizedBox(height: 24),

            // Example 8: Location Tags with Custom Builder
            _buildSectionTitle('8. Custom Tag Builder (Location with Icons)'),
            TagField(
              initialTags: locationTags,
              containerBorderColor: Colors.teal.shade300,
              hintText: 'Add locations...',
              tagBuilder: (tag, index, onDelete) {
                return Container(
                  margin: const EdgeInsets.only(right: 6, bottom: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal.shade200, Colors.teal.shade100],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.teal.shade200.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.teal.shade700,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        tag,
                        style: TextStyle(
                          color: Colors.teal.shade800,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: onDelete,
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.teal.shade600,
                        ),
                      ),
                    ],
                  ),
                );
              },
              onTagsChanged: (tags) => setState(() => locationTags = tags),
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(
              '9. Column Layout with Animations and  Allow Duplicates',
            ),
            TagField(
              layout: TagInputLayout.wrap,
              allowDuplicates: true,
              tagBackgroundColor: Colors.pink.shade100,
              tagTextColor: Colors.pink.shade800,
              tagBorderColor: Colors.pink.shade300,
              containerBorderColor: Colors.pink.shade200,
              enableAnimations: true,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.bounceIn,
              hintText: 'Add items vertically...',
              crossAxisAlignment: CrossAxisAlignment.start,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(
              '10.OutSide of Texfield and above  the Tag  with Animations ',
            ),
            TagField(
              layout: TagInputLayout.outsideAbove,
              allowDuplicates: true,
              tagBackgroundColor: Colors.pink.shade100,
              tagTextColor: Colors.pink.shade800,
              tagBorderColor: Colors.pink.shade300,
              containerBorderColor: Colors.pink.shade200,
              enableAnimations: true,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.bounceIn,
              hintText: 'Add items vertically...',
              crossAxisAlignment: CrossAxisAlignment.start,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(
              '12. OutSide of Texfield and below Side the Tag with Animations',
            ),
            TagField(
              layout: TagInputLayout.outsideBelow,
              allowDuplicates: true,
              tagBackgroundColor: Colors.pink.shade100,
              tagTextColor: Colors.pink.shade800,
              tagBorderColor: Colors.pink.shade300,
              containerBorderColor: Colors.pink.shade200,
              enableAnimations: true,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.bounceIn,
              hintText: 'Add items vertically...',
              crossAxisAlignment: CrossAxisAlignment.start,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle(
              '12. Inside of Texfield and below Side the Tag  with Animations',
            ),
            TagField(
              layout: TagInputLayout.insideBelow,
              allowDuplicates: true,
              tagBackgroundColor: Colors.pink.shade100,
              tagTextColor: Colors.pink.shade800,
              tagBorderColor: Colors.pink.shade300,
              containerBorderColor: Colors.pink.shade200,
              enableAnimations: true,
              animationDuration: const Duration(milliseconds: 300),
              animationCurve: Curves.bounceIn,
              hintText: 'Add items vertically...',
              crossAxisAlignment: CrossAxisAlignment.start,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
