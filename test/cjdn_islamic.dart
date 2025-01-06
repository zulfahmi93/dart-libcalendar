import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group('fromIslamicToCjdn() method tests.', () {
    fromIslamicToCjdnYearParameterLessThan1317();
    fromIslamicToCjdnYearParameterMoreThan1524();
    fromIslamicToCjdnMonthParameterLessThan1();
    fromIslamicToCjdnMonthParameterMoreThan12();
    fromIslamicToCjdnDayParameterLessThan1();
    fromIslamicToCjdnDayParameterMoreThan30();
    fromIslamicToCjdnDateBeforeShaaban28th1317();
    fromIslamicToCjdnDateAfterShawwal29th1524();
    fromIslamicToCjdnConvertShaaban29th1432ToCJDN();
  });

  group('fromCjdnToIslamic() method tests.', () {
    fromCjdnToIslamicCjdnParameterLessThan2415021();
    fromCjdnToIslamicCjdnParameterMoreThan2488434();
    fromCjdnToIslamicConvert2455774ToGregorian();
  });
}

void fromIslamicToCjdnYearParameterLessThan1317() {
  test('Invalid year parameter (less than 1317) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1316, 1, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [year] should be between 1317 to 1524.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnYearParameterMoreThan1524() {
  test('Invalid year parameter (more than 1524) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1525, 1, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [year] should be between 1317 to 1524.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnMonthParameterLessThan1() {
  test('Invalid month parameter (less than 1) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1430, 0, 1),
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

void fromIslamicToCjdnMonthParameterMoreThan12() {
  test('Invalid month parameter (more than 12) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1430, 13, 1),
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

void fromIslamicToCjdnDayParameterLessThan1() {
  test('Invalid day parameter (less than 1) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1430, 1, 0),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [day] should be between 1 to 30.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnDayParameterMoreThan30() {
  test('Invalid day parameter (more than 30) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1430, 1, 31),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason == 'Parameter [day] should be between 1 to 30.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnDateBeforeShaaban28th1317() {
  test('Invalid date range (before Sha\'aban 28th, 1317) should throw error.',
      () {
    expect(
      () => fromIslamicToCjdn(1317, 8, 27),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason ==
                  'Invalid Islamic date range. It should be between Sha\'aban '
                      '28th, 1317 until Shawwal 29th, 1524.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnDateAfterShawwal29th1524() {
  test('Invalid date range (after Shawwal 29th, 1524) should throw error.', () {
    expect(
      () => fromIslamicToCjdn(1524, 11, 1),
      throwsA(
        predicate(
          (e) =>
              e is CalendarConversionError &&
              e.reason ==
                  'Invalid Islamic date range. It should be between Sha\'aban '
                      '28th, 1317 until Shawwal 29th, 1524.',
        ),
      ),
    );
  });
}

void fromIslamicToCjdnConvertShaaban29th1432ToCJDN() {
  test('Convert Sha\'aban 29th, 1432 to CJDN.', () {
    expect(fromIslamicToCjdn(1432, 8, 29), equals(2455774));
  });
}

void fromCjdnToIslamicCjdnParameterLessThan2415021() {
  test('Invalid cjdn parameter (less than 2415021) should throw error.', () {
    expect(
      () => fromCjdnToIslamic(2415020),
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

void fromCjdnToIslamicCjdnParameterMoreThan2488434() {
  test('Invalid cjdn parameter (more than 2488434) should throw error.', () {
    expect(
      () => fromCjdnToIslamic(2488435),
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

void fromCjdnToIslamicConvert2455774ToGregorian() {
  test('Convert CJDN 2455774 to Islamic.', () {
    expect(fromCjdnToIslamic(2455774), equals(DateTime.utc(1432, 8, 29)));
  });
}
