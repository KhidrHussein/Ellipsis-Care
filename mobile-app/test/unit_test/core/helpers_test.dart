import 'package:ellipsis_care/core/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Tests for Utility class [UtilHelpers]", () {
    test('Formats String', () {
      final String formattedDate = UtilHelpers.dateFormatter1(DateTime.now());

      expect(formattedDate, "");
    });
  });
}
