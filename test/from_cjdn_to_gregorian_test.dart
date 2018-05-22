import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group('fromCJDNtoGregorian() method tests.', () {
    fromCJDNtoGregorianCjdnParameterLessThan2415021();
    fromCJDNtoGregorianCjdnParameterMoreThan2488434();
    fromCJDNtoGregorianConvert2452827ToGregorian();
    fromCJDNtoGregorianConvert2451604ToGregorian();
    fromCJDNtoGregorianConvert2451605ToGregorian();
    fromCJDNtoGregorianConvert2451969ToGregorian();
    fromCJDNtoGregorianConvert2451970ToGregorian();
    fromCJDNtoGregorianConvert2488128ToGregorian();
    fromCJDNtoGregorianConvert2488129ToGregorian();
  });
}

void fromCJDNtoGregorianCjdnParameterLessThan2415021() {
  test('Invalid cjdn parameter (less than 2415021) should throw error.', () {
    try {
      fromCJDNtoGregorian(2415020);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [cjdn] should be between 2415021 to 2488434.'));
    }
  });
}

void fromCJDNtoGregorianCjdnParameterMoreThan2488434() {
  test('Invalid cjdn parameter (more than 2488434) should throw error.', () {
    try {
      fromCJDNtoGregorian(2488435);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      expect(e.runtimeType.toString(), equals('_CalendarConversionError'));
      expect(e.reason,
          equals('Parameter [cjdn] should be between 2415021 to 2488434.'));
    }
  });
}

void fromCJDNtoGregorianConvert2452827ToGregorian() {
  test('Convert CJDN 2452827 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2452827), equals(new DateTime.utc(2003, 7, 6)));
  });
}

void fromCJDNtoGregorianConvert2451604ToGregorian() {
  test('Convert CJDN 2451604 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2451604), equals(new DateTime.utc(2000, 2, 29)));
  });
}

void fromCJDNtoGregorianConvert2451605ToGregorian() {
  test('Convert CJDN 2451605 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2451605), equals(new DateTime.utc(2000, 3, 1)));
  });
}

void fromCJDNtoGregorianConvert2451969ToGregorian() {
  test('Convert CJDN 2451969 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2451969), equals(new DateTime.utc(2001, 2, 28)));
  });
}

void fromCJDNtoGregorianConvert2451970ToGregorian() {
  test('Convert CJDN 2451970 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2451970), equals(new DateTime.utc(2001, 3, 1)));
  });
}

void fromCJDNtoGregorianConvert2488128ToGregorian() {
  test('Convert CJDN 2488128 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2488128), equals(new DateTime.utc(2100, 2, 28)));
  });
}

void fromCJDNtoGregorianConvert2488129ToGregorian() {
  test('Convert CJDN 2488129 to Gregorian.', () {
    expect(fromCJDNtoGregorian(2488129), equals(new DateTime.utc(2100, 3, 1)));
  });
}
