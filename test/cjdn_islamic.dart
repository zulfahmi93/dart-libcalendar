import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group('fromIslamicToCJDN() method tests.', () {
    fromIslamicToCJDNYearParameterLessThan1317();
    fromIslamicToCJDNYearParameterMoreThan1524();
    fromIslamicToCJDNMonthParameterLessThan1();
    fromIslamicToCJDNMonthParameterMoreThan12();
    fromIslamicToCJDNDayParameterLessThan1();
    fromIslamicToCJDNDayParameterMoreThan30();
    fromIslamicToCJDNDateBeforeShaaban28th1317();
    fromIslamicToCJDNDateAfterShawwal29th1524();
    fromIslamicToCJDNConvertShaaban29th1432ToCJDN();
  });

  group('fromCJDNtoIslamic() method tests.', () {
    fromCJDNtoIslamicCjdnParameterLessThan2415021();
    fromCJDNtoIslamicCjdnParameterMoreThan2488434();
    fromCJDNtoIslamicConvert2455774ToGregorian();
  });
}

void fromIslamicToCJDNYearParameterLessThan1317() {
  test('Invalid year parameter (less than 1317) should throw error.', () {
    try {
      fromIslamicToCJDN(1316, 1, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [year] should be between 1317 to 1524.'));
    }
  });
}

void fromIslamicToCJDNYearParameterMoreThan1524() {
  test('Invalid year parameter (more than 1524) should throw error.', () {
    try {
      fromIslamicToCJDN(1525, 1, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [year] should be between 1317 to 1524.'));
    }
  });
}

void fromIslamicToCJDNMonthParameterLessThan1() {
  test('Invalid month parameter (less than 1) should throw error.', () {
    try {
      fromIslamicToCJDN(1430, 0, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [month] should be between 1 to 12.'));
    }
  });
}

void fromIslamicToCJDNMonthParameterMoreThan12() {
  test('Invalid month parameter (more than 12) should throw error.', () {
    try {
      fromIslamicToCJDN(1430, 13, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [month] should be between 1 to 12.'));
    }
  });
}

void fromIslamicToCJDNDayParameterLessThan1() {
  test('Invalid day parameter (less than 1) should throw error.', () {
    try {
      fromIslamicToCJDN(1430, 1, 0);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(
          e.reason, equals('Parameter [day] should be between 1 to 30.'));
    }
  });
}

void fromIslamicToCJDNDayParameterMoreThan30() {
  test('Invalid day parameter (more than 30) should throw error.', () {
    try {
      fromIslamicToCJDN(1430, 1, 31);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [day] should be between 1 to 30.'));
    }
  });
}

void fromIslamicToCJDNDateBeforeShaaban28th1317() {
  test('Invalid date range (before Sha\'aban 28th, 1317) should throw error.', () {
    try {
      fromIslamicToCJDN(1317, 8, 27);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Invalid Islamic date range. It should be between Sha\'aban 28th, 1317 until Shawwal 29th, 1524.'));
    }
  });
}

void fromIslamicToCJDNDateAfterShawwal29th1524() {
  test('Invalid date range (after Shawwal 29th, 1524) should throw error.', () {
    try {
      fromIslamicToCJDN(1524, 11, 1);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Invalid Islamic date range. It should be between Sha\'aban 28th, 1317 until Shawwal 29th, 1524.'));
    }
  });
}

void fromIslamicToCJDNConvertShaaban29th1432ToCJDN() {
  test('Convert Sha\'aban 29th, 1432 to CJDN.', () {
    expect(fromIslamicToCJDN(1432, 8, 29), equals(2455774));
  });
}


void fromCJDNtoIslamicCjdnParameterLessThan2415021() {
  test('Invalid cjdn parameter (less than 2415021) should throw error.', () {
    try {
      fromCJDNtoIslamic(2415020);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [cjdn] should be between 2415021 to 2488434.'));
    }
  });
}

void fromCJDNtoIslamicCjdnParameterMoreThan2488434() {
  test('Invalid cjdn parameter (more than 2488434) should throw error.', () {
    try {
      fromCJDNtoIslamic(2488435);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [cjdn] should be between 2415021 to 2488434.'));
    }
  });
}

void fromCJDNtoIslamicConvert2455774ToGregorian() {
  test('Convert CJDN 2455774 to Islamic.', () {
    expect(fromCJDNtoIslamic(2455774), equals(new DateTime.utc(1432, 8, 29)));
  });
}
