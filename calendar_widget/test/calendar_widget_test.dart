import 'package:flutter_test/flutter_test.dart';
import 'package:calendar_widget/calendar_logic.dart';

void main() {
  group('Unit Test', () {
    test('Generate calendar dates for month 2022/01', () {
      final date = DateTime(2022, 1, 1);
      final offset = DateTime.monday;
      final calendar = CalendarGenerator().buildMonthly(date, offset);
      expect(
        calendar,
        [
          [null, null, null, null, null, 1, 2],
          [3, 4, 5, 6, 7, 8, 9],
          [10, 11, 12, 13, 14, 15, 16],
          [17, 18, 19, 20, 21, 22, 23],
          [24, 25, 26, 27, 28, 29, 30],
          [31, null, null, null, null, null, null],
        ]
      );
    });
  });
}
