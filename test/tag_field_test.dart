import 'package:flutter_test/flutter_test.dart';
import 'package:tag_field/tag_field.dart';

void main() {
  test('TagInputNotifier adds and removes tags correctly', () {
    final widget = TagField();
    final notifier = TagInputNotifier(widget);

    // Test adding a tag
    notifier.addTag('test'); // No context needed
    expect(notifier.tags, ['test']);

    // Test removing a tag
    notifier.removeTag(0);
    expect(notifier.tags, []);
  });
}
