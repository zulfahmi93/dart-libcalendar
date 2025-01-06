import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group('fromCjdnToGregorian() method tests.', () {
    fromCjdnToGregorianCjdnParameterLessThan2415021();
    fromCjdnToGregorianCjdnParameterMoreThan2488434();
    fromCjdnToGregorianConvert2452827ToGregorian();
    fromCjdnToGregorianConvert2451604ToGregorian();
    fromCjdnToGregorianConvert2451605ToGregorian();
    fromCjdnToGregorianConvert2451969ToGregorian();
    fromCjdnToGregorianConvert2451970ToGregorian();
    fromCjdnToGregorianConvert2488128ToGregorian();
    fromCjdnToGregorianConvert2488129ToGregorian();
  });
}

void fromCjdnToGregorianCjdnParameterLessThan2415021() {
  test('Invalid cjdn parameter (less than 2415021) should throw error.', () {
    expect(
      () => fromCjdnToGregorian(2415020),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason ==
                  'Parameter [cjdn] should be between 2415021 to 2488434.',
        ),
      ),
    );
  });
}

void fromCjdnToGregorianCjdnParameterMoreThan2488434() {
  test('Invalid cjdn parameter (more than 2488434) should throw error.', () {
    expect(
      () => fromCjdnToGregorian(2488435),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason ==
                  'Parameter [cjdn] should be between 2415021 to 2488434.',
        ),
      ),
    );
  });
}

void fromCjdnToGregorianConvert2452827ToGregorian() {
  test('Convert CJDN 2452827 to Gregorian.', () {
    expect(fromCjdnToGregorian(2452827), equals(DateTime.utc(2003, 7, 6)));
  });
}

void fromCjdnToGregorianConvert2451604ToGregorian() {
  test('Convert CJDN 2451604 to Gregorian.', () {
    expect(fromCjdnToGregorian(2451604), equals(DateTime.utc(2000, 2, 29)));
  });
}

void fromCjdnToGregorianConvert2451605ToGregorian() {
  test('Convert CJDN 2451605 to Gregorian.', () {
    expect(fromCjdnToGregorian(2451605), equals(DateTime.utc(2000, 3, 1)));
  });
}

void fromCjdnToGregorianConvert2451969ToGregorian() {
  test('Convert CJDN 2451969 to Gregorian.', () {
    expect(fromCjdnToGregorian(2451969), equals(DateTime.utc(2001, 2, 28)));
  });
}

void fromCjdnToGregorianConvert2451970ToGregorian() {
  test('Convert CJDN 2451970 to Gregorian.', () {
    expect(fromCjdnToGregorian(2451970), equals(DateTime.utc(2001, 3, 1)));
  });
}

void fromCjdnToGregorianConvert2488128ToGregorian() {
  test('Convert CJDN 2488128 to Gregorian.', () {
    expect(fromCjdnToGregorian(2488128), equals(DateTime.utc(2100, 2, 28)));
  });
}

void fromCjdnToGregorianConvert2488129ToGregorian() {
  test('Convert CJDN 2488129 to Gregorian.', () {
    expect(fromCjdnToGregorian(2488129), equals(DateTime.utc(2100, 3, 1)));
  });
}
