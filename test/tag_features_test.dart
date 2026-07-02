import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tag_field/tag_field.dart';

void main() {
  Widget buildTestWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }

  testWidgets('TagField displays suggestions matching input and selects suggestion',
      (WidgetTester tester) async {
    final suggestionsList = ['apple', 'banana', 'apricot', 'cherry'];
    final selectedTags = <String>[];

    await tester.pumpWidget(
      buildTestWidget(
        TagField(
          suggestions: suggestionsList,
          onTagsChanged: (tags) {
            selectedTags.clear();
            selectedTags.addAll(tags);
          },
        ),
      ),
    );

    // Focus and type 'ap'
    final textFieldFinder = find.byType(TextField);
    await tester.tap(textFieldFinder);
    await tester.enterText(textFieldFinder, 'ap');
    await tester.pump();

    // Verify suggestions matching 'ap' are displayed ('apple', 'apricot')
    expect(find.text('apple'), findsOneWidget);
    expect(find.text('apricot'), findsOneWidget);
    expect(find.text('banana'), findsNothing);

    // Tap on the 'apple' suggestion
    await tester.tap(find.text('apple'));
    await tester.pump();

    // Verify 'apple' tag is added and suggestions are dismissed
    expect(selectedTags, contains('apple'));
    expect(find.text('apple'), findsOneWidget); // Tag chip
    expect(find.text('apricot'), findsNothing); // Dropdown hidden
  });

  testWidgets('TagField backspace highlights last tag and deletes on second backspace',
      (WidgetTester tester) async {
    final selectedTags = <String>[];

    await tester.pumpWidget(
      buildTestWidget(
        TagField(
          initialTags: const ['tag1', 'tag2'],
          onTagsChanged: (tags) {
            selectedTags.clear();
            selectedTags.addAll(tags);
          },
        ),
      ),
    );

    // Tap the textfield to focus
    final textFieldFinder = find.byType(TextField);
    await tester.tap(textFieldFinder);
    await tester.pump();

    // Send first backspace: should highlight last tag ('tag2')
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();

    // Send second backspace: should delete 'tag2'
    await tester.sendKeyEvent(LogicalKeyboardKey.backspace);
    await tester.pumpAndSettle();

    expect(selectedTags, const ['tag1']);
  });

  testWidgets('TagField arrow keys shift highlighted tag and Delete removes it',
      (WidgetTester tester) async {
    final selectedTags = <String>[];

    await tester.pumpWidget(
      buildTestWidget(
        TagField(
          initialTags: const ['tag1', 'tag2', 'tag3'],
          onTagsChanged: (tags) {
            selectedTags.clear();
            selectedTags.addAll(tags);
          },
        ),
      ),
    );

    // Tap to focus
    final textFieldFinder = find.byType(TextField);
    await tester.tap(textFieldFinder);
    await tester.pump();

    // Arrow left should highlight the last tag ('tag3')
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();

    // Another arrow left should highlight 'tag2'
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowLeft);
    await tester.pumpAndSettle();

    // Pressing delete should remove 'tag2'
    await tester.sendKeyEvent(LogicalKeyboardKey.delete);
    await tester.pumpAndSettle();

    expect(selectedTags, const ['tag1', 'tag3']);
  });

  testWidgets('TagField limits tag character length when maxTagLength is specified',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestWidget(
        TagField(
          maxTagLength: 5,
        ),
      ),
    );

    // Tap to focus
    final textFieldFinder = find.byType(TextField);
    await tester.tap(textFieldFinder);
    await tester.pump();

    // Type 8 characters: only 5 should be accepted
    await tester.enterText(textFieldFinder, 'abcdefgh');
    await tester.pump();

    final text = tester.widget<TextField>(textFieldFinder).controller!.text;
    expect(text, 'abcde');
  });
}
