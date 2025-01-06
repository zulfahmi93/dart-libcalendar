import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group('fromGregorianToCjdn() method tests.', () {
    fromGregorianToCjdnYearParameterLessThan1900();
    fromGregorianToCjdnYearParameterMoreThan2100();
    fromGregorianToCjdnMonthParameterLessThan1();
    fromGregorianToCjdnMonthParameterMoreThan12();
    fromGregorianToCjdnDayParameterLessThan1();
    fromGregorianToCjdnDayParameterMoreThan31();
    fromGregorianToCjdnConvertSeptember7th2010ToCJDN();
    fromGregorianToCjdnConvertFebruary29th2000ToCJDN();
    fromGregorianToCjdnConvertMarch1st2000ToCJDN();
    fromGregorianToCjdnConvertFebruary28th2001ToCJDN();
    fromGregorianToCjdnConvertMarch1st2001ToCJDN();
    fromGregorianToCjdnConvertFebruary28th2100ToCJDN();
    fromGregorianToCjdnConvertMarch1st2100ToCJDN();
  });
}

void fromGregorianToCjdnYearParameterLessThan1900() {
  test('Invalid year parameter (less than 1900) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(1899, 1, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [year] should be between 1900 to 2100.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnYearParameterMoreThan2100() {
  test('Invalid year parameter (more than 2100) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(2101, 1, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [year] should be between 1900 to 2100.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnMonthParameterLessThan1() {
  test('Invalid month parameter (less than 1) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(2000, 0, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [month] should be between 1 to 12.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnMonthParameterMoreThan12() {
  test('Invalid month parameter (more than 12) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(2000, 13, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [month] should be between 1 to 12.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnDayParameterLessThan1() {
  test('Invalid day parameter (less than 1) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(2000, 1, 0),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [day] should be between 1 to 31.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnDayParameterMoreThan31() {
  test('Invalid day parameter (more than 31) should throw error.', () {
    expect(
      () => fromGregorianToCjdn(2000, 1, 32),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [day] should be between 1 to 31.',
        ),
      ),
    );
  });
}

void fromGregorianToCjdnConvertSeptember7th2010ToCJDN() {
  test('Convert September 7th, 2010 to CJDN.', () {
    expect(fromGregorianToCjdn(2010, 9, 7), equals(2455447));
  });
}

void fromGregorianToCjdnConvertFebruary29th2000ToCJDN() {
  test('Convert February 29th, 2000 to CJDN.', () {
    expect(fromGregorianToCjdn(2000, 2, 29), equals(2451604));
  });
}

void fromGregorianToCjdnConvertMarch1st2000ToCJDN() {
  test('Convert March 1st, 2000 to CJDN.', () {
    expect(fromGregorianToCjdn(2000, 3, 1), equals(2451605));
  });
}

void fromGregorianToCjdnConvertFebruary28th2001ToCJDN() {
  test('Convert February 28th, 2001 to CJDN.', () {
    expect(fromGregorianToCjdn(2001, 2, 28), equals(2451969));
  });
}

void fromGregorianToCjdnConvertMarch1st2001ToCJDN() {
  test('Convert March 1st, 2001 to CJDN.', () {
    expect(fromGregorianToCjdn(2001, 3, 1), equals(2451970));
  });
}

void fromGregorianToCjdnConvertFebruary28th2100ToCJDN() {
  test('Convert February 28th, 2100 to CJDN.', () {
    expect(fromGregorianToCjdn(2100, 2, 28), equals(2488128));
  });
}

void fromGregorianToCjdnConvertMarch1st2100ToCJDN() {
  test('Convert March 1st, 2100 to CJDN.', () {
    expect(fromGregorianToCjdn(2100, 3, 1), equals(2488129));
  });
}
