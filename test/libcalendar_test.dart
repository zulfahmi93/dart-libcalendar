import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  testCalendarConverterClass();
}

void testCalendarConverterClass() {
  group('CalendarConverter class tests.', () {
    DateTime october15_1582;

    setUp(() {
      october15_1582 = new DateTime.utc(1582, 10, 15);
    });

    test('Convert October 15th, 1582 to Julian Day.', () {
      expect(
          CalendarConverter.gregorianToJulianDay(october15_1582) == 2299160.5,
          isTrue);
    });
  });
}