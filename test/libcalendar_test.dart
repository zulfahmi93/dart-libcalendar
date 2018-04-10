import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  testCalendarConverterClass();
}

void testCalendarConverterClass() {
  group('CalendarConverter class tests.', () {
    DateTime october15_1582, january10_2018, january15_2018;

    setUp(() {
      october15_1582 = new DateTime.utc(1582, 10, 15);
      january10_2018 = new DateTime.utc(2018, 1, 10);
      january15_2018 = new DateTime(2015, 1, 15);
    });

    test('Convert October 15th, 1582 to Julian Day.', () {
      expect(
          CalendarConverter.gregorianToJulianDay(october15_1582) == 2299160.5,
          isTrue);
    });
    test('Convert January 10th, 2018 to Julian Day.', () {
      expect(
          CalendarConverter.gregorianToJulianDay(january10_2018) == 2458128.5,
          isTrue);
    });
    test('Should throw when given date is not in UTC.', () {
      try {
        CalendarConverter.gregorianToJulianDay(january15_2018);
      } catch (e) {
        expect(e.runtimeType.toString() == '_CalendarConversionError', isTrue);
      }
    });
  });
}