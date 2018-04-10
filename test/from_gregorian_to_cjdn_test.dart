import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void fromGregorianToCJDNYearParameterLessThan1900() {
  test('Invalid year parameter (less than 1900) should throw error.', () {
    try {
      fromGregorianToCJDN(1899, 1, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [year] should be between 1900 to 2100.'));
    }
  });
}

void fromGregorianToCJDNYearParameterMoreThan2100() {
  test('Invalid year parameter (more than 2100) should throw error.', () {
    try {
      fromGregorianToCJDN(2101, 1, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [year] should be between 1900 to 2100.'));
    }
  });
}

void fromGregorianToCJDNMonthParameterLessThan1() {
  test('Invalid month parameter (less than 1) should throw error.', () {
    try {
      fromGregorianToCJDN(2000, 0, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [month] should be between 1 to 12.'));
    }
  });
}

void fromGregorianToCJDNMonthParameterMoreThan12() {
  test('Invalid month parameter (more than 12) should throw error.', () {
    try {
      fromGregorianToCJDN(2000, 13, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [month] should be between 1 to 12.'));
    }
  });
}

void fromGregorianToCJDNDayParameterLessThan1() {
  test('Invalid day parameter (less than 1) should throw error.', () {
    try {
      fromGregorianToCJDN(2000, 1, 0);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [day] should be between 1 to 31.'));
    }
  });
}

void fromGregorianToCJDNDayParameterMoreThan31() {
  test('Invalid day parameter (more than 31) should throw error.', () {
    try {
      fromGregorianToCJDN(2000, 1, 32);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [day] should be between 1 to 31.'));
    }
  });
}

void fromGregorianToCJDNConvertSeptember7th2010ToCJDN() {
  test('Convert September 7th, 2010 to CJDN.', () {
    expect(fromGregorianToCJDN(2010, 9, 7), equals(2455447));
  });
}

void fromGregorianToCJDNConvertFebruary29th2000ToCJDN() {
  test('Convert February 29th, 2000 to CJDN.', () {
    expect(fromGregorianToCJDN(2000, 2, 29), equals(2451604));
  });
}

void fromGregorianToCJDNConvertMarch1st2000ToCJDN() {
  test('Convert March 1st, 2000 to CJDN.', () {
    expect(fromGregorianToCJDN(2000, 3, 1), equals(2451605));
  });
}

void fromGregorianToCJDNConvertFebruary28th2001ToCJDN() {
  test('Convert February 28th, 2001 to CJDN.', () {
    expect(fromGregorianToCJDN(2001, 2, 28), equals(2451969));
  });
}

void fromGregorianToCJDNConvertMarch1st2001ToCJDN() {
  test('Convert March 1st, 2001 to CJDN.', () {
    expect(fromGregorianToCJDN(2001, 3, 1), equals(2451970));
  });
}

void fromGregorianToCJDNConvertFebruary28th2100ToCJDN() {
  test('Convert February 28th, 2100 to CJDN.', () {
    expect(fromGregorianToCJDN(2100, 2, 28), equals(2488128));
  });
}

void fromGregorianToCJDNConvertMarch1st2100ToCJDN() {
  test('Convert March 1st, 2100 to CJDN.', () {
    expect(fromGregorianToCJDN(2100, 3, 1), equals(2488129));
  });
}
