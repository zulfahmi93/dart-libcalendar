import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group(
    'fromGregorianToJulianDate() method tests.',
    fromGregorianToJulianDateConvertApril11th2018ToJulianDate,
  );
  group(
    'fromJulianDateToGregorian() method tests.',
    fromJulianDateToGregorianConvert2458219_9166666665ToGregorian,
  );
}

void fromGregorianToJulianDateConvertApril11th2018ToJulianDate() {
  test('Convert April 11th, 2018 to Julian Date.', () {
    expect(
      fromGregorianToJulianDate(DateTime.utc(2018, 4, 11, 10, 0)),
      equals(2458219.9166666665),
    );
  });
}

void fromJulianDateToGregorianConvert2458219_9166666665ToGregorian() {
  test('Convert Julian Date 2458219.9166666665 to Gregorian.', () {
    expect(
      fromJulianDateToGregorian(2458219.9166666665),
      equals(DateTime.utc(2018, 4, 11, 10, 0)),
    );
  });
}
