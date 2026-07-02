import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_field/tag_field.dart';

void main() {
  Widget buildTestForm({
    required GlobalKey<FormState> formKey,
    required List<String> initialTags,
    required String? Function(List<String>?)? validator,
    required void Function(List<String>?)? onSaved,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              TagFormField(
                initialValue: initialTags,
                validator: validator,
                onSaved: onSaved,
              ),
            ],
          ),
        ),
      ),
    );
  }

  testWidgets('TagFormField displays validation error', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      buildTestForm(
        formKey: formKey,
        initialTags: [],
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tags cannot be empty';
          }
          return null;
        },
        onSaved: null,
      ),
    );

    // Initial state: no error shown
    expect(find.text('Tags cannot be empty'), findsNothing);

    // Validate form
    formKey.currentState!.validate();
    await tester.pump();

    // Error should be shown now
    expect(find.text('Tags cannot be empty'), findsOneWidget);
  });

  testWidgets('TagFormField saves state correctly', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    List<String>? savedTags;

    await tester.pumpWidget(
      buildTestForm(
        formKey: formKey,
        initialTags: ['flutter', 'dart'],
        validator: null,
        onSaved: (value) {
          savedTags = value;
        },
      ),
    );

    // Save form
    formKey.currentState!.save();

    // Saved tags should match initial values
    expect(savedTags, ['flutter', 'dart']);
  });

  testWidgets('TagFormField resets to initial value', (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      buildTestForm(
        formKey: formKey,
        initialTags: ['initial'],
        validator: null,
        onSaved: null,
      ),
    );

    // Verify initial tag is present
    expect(find.text('initial'), findsOneWidget);

    // Reset form
    formKey.currentState!.reset();
    await tester.pump();

    // Verify tag is still present (as it resets to initial tags)
    expect(find.text('initial'), findsOneWidget);
  });
}
