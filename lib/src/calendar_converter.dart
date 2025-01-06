import 'package:logging/logging.dart';

// ################################# CONSTANTS #################################
const _kDaysToMonth365 = <int>[
  0,
  31,
  59,
  90,
  120,
  151,
  181,
  212,
  243,
  273,
  304,
  334,
  365,
];
const _kDaysToMonth366 = <int>[
  0,
  31,
  60,
  91,
  121,
  152,
  182,
  213,
  244,
  274,
  305,
  335,
  366,
];
final _kJulianEpoch = DateTime.utc(-4713, 11, 24, 12, 0);
const _kMicrosecondsInOneDay = 86400000000;

// ################################# FUNCTIONS #################################
/// Converts Gregorian calendar, given by parameter [year], [month] and [day]
/// to Chronological Julian Day Number (CJDN).
///
/// CJDN is the number of days elapsed since the beginning of the Julian
/// Period, which started on 4713 BCE January 1 (Julian calendar), which is
/// equivalent to 4713 BCE November 17 (Gregorian calendar).
///
/// CJDN is an integer number of days since the start of the Julian Period.
/// The number can be positive (after the start of the Julian Period), zero
/// (at the start of the Julian Period), or negative (before the start of the
/// Julian Period).
///
/// Throws a [CalendarConversionError] if any of these parameters is out of
/// range:
/// - [year] should be between 1900 to 2100.
/// - [month] should be between 1 to 12.
/// - [day] should be between 1 to 28/29/30/31 depending on the month and year.
///
/// The algorithm used in this function to convert Gregorian calendar to CJDN
/// is based on the algorithm from [1].
///
/// [1] http://aa.quae.nl/en/reken/juliaansedag.html
int fromGregorianToCjdn(int year, int month, int day) {
  final log = _createLogger('gregorian-to-cjdn')
    ..finer('Converting Gregorian date $year-$month-$day to CJDN.');

  // Check year range.
  if (year < 1900 || year > 2100) {
    const msg = 'Parameter [year] should be between 1900 to 2100.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  // Check month range.
  if (month < 1 || month > 12) {
    const msg = 'Parameter [month] should be between 1 to 12.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final isGregorianLeapYear =
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  // Check day validity for given month.
  final days = isGregorianLeapYear ? _kDaysToMonth366 : _kDaysToMonth365;
  final maxDay = days[month] - days[month - 1];

  if (day < 1 || day > maxDay) {
    final msg = 'Parameter [day] should be between 1 to $maxDay.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final c0 = ((month - 3) / 12).floor();
  final x4 = year + c0;
  final x3 = (x4 / 100).floor();
  final x2 = x4 % 100;
  final x1 = month - (12 * c0) - 3;
  final cjdn = ((146097 * x3) / 4).floor() +
      ((36525 * x2) / 100).floor() +
      (((153 * x1) + 2) / 5).floor() +
      day +
      1721119;

  log
    ..finest('c0 = $c0')
    ..finest('x4 = $x4')
    ..finest('x3 = $x3')
    ..finest('x2 = $x2')
    ..finest('x1 = $x1')
    ..finest('cjdn = $cjdn')
    ..finer('Gregorian date $year-$month-$day converted to CJDN $cjdn.');

  return cjdn;
}

/// Converts Chronological Julian Day Number (CJDN) given by parameter [cjdn]
/// to Gregorian calendar as a [DateTime] object. The [DateTime] object
/// returned will always be in UTC.
///
/// The CJDN must be within the range from 2415021 to 2488434, which corresponds
/// to the dates between 1/1/1900 and 31/12/2100 in the Gregorian calendar.
///
/// Throws a [CalendarConversionError] if the [cjdn] is out of range.
///
/// The algorithm used in this function to convert CJDN to Gregorian calendar
/// is based on the algorithm from [1].
///
/// [1] http://aa.quae.nl/en/reken/juliaansedag.html
DateTime fromCjdnToGregorian(int cjdn) {
  final log = _createLogger('cjdn-to-gregorian')
    ..finer('Converting CJDN $cjdn to Gregorian calendar.');

  // Check range (1/1/1900 to 31/12/2100).
  if (cjdn < 2415021 || cjdn > 2488434) {
    const msg = 'Parameter [cjdn] should be between 2415021 to 2488434.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final k3 = (4 * cjdn) - 6884477;
  final x3 = (k3 / 146097).floor();
  final r3 = k3 % 146097;

  final k2 = (100 * (r3 / 4).floor()) + 99;
  final x2 = (k2 / 36525).floor();
  final r2 = k2 % 36525;

  final k1 = (5 * (r2 / 100).floor()) + 2;
  final x1 = (k1 / 153).floor();
  final r1 = k1 % 153;

  final c0 = ((x1 + 2) / 12).floor();
  final day = (r1 / 5).floor() + 1;
  final month = x1 - (12 * c0) + 3;
  final year = (100 * x3) + x2 + c0;

  log
    ..finest('x3 = $x3')
    ..finest('x2 = $x2')
    ..finest('x1 = $x1')
    ..finest('c0 = $c0')
    ..finest('day = $day')
    ..finest('month = $month')
    ..finest('year = $year')
    ..finer('CJDN $cjdn converted to Gregorian date $year-$month-$day.');

  return DateTime.utc(year, month, day);
}

/// Converts an Islamic calendar date, given by parameters [year], [month],
/// and [day], to a Chronological Julian Day Number (CJDN).
///
/// The [year] parameter must be between 1317 and 1524, [month] must be
/// between 1 and 12, and [day] must be between 1 and 30. The Islamic date
/// range should be from Sha'aban 28th, 1317 to Shawwal 29th, 1524.
///
/// Throws a [CalendarConversionError] if the date does not fall within the
/// valid Islamic date range between Sha'aban 28th, 1317 and Shawwal 29th, 1524,
/// or if any of these parameters is out of
/// range:
/// - [year] should be between 1317 to 1524.
/// - [month] should be between 1 to 12.
/// - [day] should be between 1 to 30.
///
/// Returns the corresponding CJDN as an integer.
int fromIslamicToCjdn(int year, int month, int day) {
  final log = _createLogger('islamic-to-cjdn')
    ..finer('Converting Islamic date $year-$month-$day to CJDN.');

  // Check year range.
  if (year < 1317 || year > 1524) {
    const msg = 'Parameter [year] should be between 1317 to 1524.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  // Check month range.
  if (month < 1 || month > 12) {
    const msg = 'Parameter [month] should be between 1 to 12.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  // Check day range.
  if (day < 1 || day > 30) {
    const msg = 'Parameter [day] should be between 1 to 30.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  // Check date range.
  final date = DateTime.utc(year, month, day);
  final min = DateTime.utc(1317, 8, 28);
  final max = DateTime.utc(1528, 10, 30);
  if (date.compareTo(min) < 0 || date.compareTo(max) >= 0) {
    const msg = 'Invalid Islamic date range. It should be between Sha\'aban '
        '28th, 1317 until Shawwal 29th, 1524.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final k2 = (((10631 * year) - 10617) / 30).floor();
  final k1 = (((325 * month) - 320) / 11).floor();
  final cjdn = k2 + k1 + day + 1948439;

  log
    ..finest('k2 = $k2')
    ..finest('k1 = $k1')
    ..finest('cjdn = $cjdn')
    ..finer('Islamic date $year-$month-$day converted to CJDN $cjdn.');
  return cjdn;
}

/// Converts a Chronological Julian Day Number (CJDN) given by parameter [cjdn]
/// to Islamic calendar as a [DateTime] object. The [DateTime] object
/// returned will always be in UTC.
///
/// The CJDN must be within the range from 2415021 to 2488434, which corresponds
/// to the dates between 1/1/1900 and 31/12/2100 in the Gregorian calendar.
///
/// Throws a [CalendarConversionError] if the [cjdn] is out of range.
DateTime fromCjdnToIslamic(int cjdn) {
  final log = _createLogger('cjdn-to-islamic')
    ..finest('Converting CJDN $cjdn to Islamic calendar.');

  // Check range (1/1/1900 to 31/12/2100).
  if (cjdn < 2415021 || cjdn > 2488434) {
    const msg = 'Parameter [cjdn] should be between 2415021 to 2488434.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final k2 = (30 * (cjdn - 1948440)) + 15;
  final k1 = (11 * ((k2 % 10631) / 30).floor()) + 5;
  final day = ((k1 % 325) / 11).floor() + 1;
  final month = (k1 / 325).floor() + 1;
  final year = (k2 / 10631).floor() + 1;

  log
    ..finest('k2 = $k2')
    ..finest('k1 = $k1')
    ..finest('day = $day')
    ..finest('month = $month')
    ..finest('year = $year')
    ..finer('CJDN $cjdn converted to Islamic date $year-$month-$day.');

  return DateTime.utc(year, month, day);
}

/// Converts Gregorian calendar, given by parameter [year], [month] and [day]
/// to Islamic calendar as a [DateTime] object. The [DateTime] object
/// returned will always be in UTC.
///
/// Throws a [CalendarConversionError] if any of these parameters is out of
/// range:
/// - [year] should be between 1900 to 2100.
/// - [month] should be between 1 to 12.
/// - [day] should be between 1 to 28/29/30/31 depending on the month and year.
DateTime fromGregorianToIslamic(int year, int month, int day) {
  final log = _createLogger('gregorian-to-islamic')
    ..finest(
      'Converting Gregorian date $year-$month-$day to Islamic calendar.',
    );

  // Convert to CDJN.
  final cjdn = fromGregorianToCjdn(year, month, day);

  // Convert to Islamic.
  final islamic = fromCjdnToIslamic(cjdn);

  log.finer(
    'Gregorian date $year-$month-$day converted to Islamic date '
    '${islamic.year}-${islamic.month}-${islamic.day}.',
  );
  return islamic;
}

/// Converts Islamic calendar, given by parameter [year], [month] and [day]
/// to Gregorian calendar as a [DateTime] object. The [DateTime] object
/// returned will always be in UTC.
///
/// Throws a [CalendarConversionError] if any of these parameters is out of
/// range:
/// - [year] should be between 1317 to 1524.
/// - [month] should be between 1 to 12.
/// - [day] should be between 1 to 30.
DateTime fromIslamicToGregorian(int year, int month, int day) {
  final log = _createLogger('islamic-to-gregorian')
    ..finest(
      'Converting Islamic date $year-$month-$day to Gregorian calendar.',
    );

  // Convert to CDJN.
  final cjdn = fromIslamicToCjdn(year, month, day);

  // Convert to Gregorian.
  final gregorian = fromCjdnToGregorian(cjdn);

  log.finer(
    'Islamic date $year-$month-$day converted to Gregorian date '
    '${gregorian.year}-${gregorian.month}-${gregorian.day}.',
  );
  return gregorian;
}

/// Converts a Gregorian date and time, given by parameter [dateTimeInUtc],
/// to Julian Date format as a [double].
///
/// The [dateTimeInUtc] parameter must be in UTC. If it is not, a
/// [CalendarConversionError] is thrown. Julian Date is a continuous count
/// of days since the beginning of the Julian period, which is November 24th,
/// 4713 BCE in the Julian calendar.
///
/// Returns the Julian Date corresponding to the input Gregorian date and time.
double fromGregorianToJulianDate(DateTime dateTimeInUtc) {
  final log = _createLogger('gregorian-to-julian')
    ..finer(
      'Converting Gregorian date and time $dateTimeInUtc to Julian calendar.',
    );

  // Check UTC-ness.
  if (!dateTimeInUtc.isUtc) {
    const msg = 'Parameter [dateTimeInUtc] should be in UTC.';
    log.severe(msg);
    throw CalendarConversionError(msg);
  }

  final difference = dateTimeInUtc.difference(_kJulianEpoch);
  final jd = difference.inMicroseconds / _kMicrosecondsInOneDay;

  log.finer(
    'Gregorian date and time $dateTimeInUtc converted to Julian Date $jd.',
  );
  return jd;
}

/// Converts Julian Date given by parameter [jd] to Gregorian date and time
/// as [DateTime] object. The [DateTime] object returned will be always in UTC.
///
/// Julian Date is a continuous count of days since the beginning of the Julian
/// period, which is November 17th, 4713 BCE in the Julian calendar.
///
/// The returned [DateTime] object is a point of time in Gregorian calendar
/// which is equivalent to the given Julian Date.
DateTime fromJulianDateToGregorian(double jd) {
  final log = _createLogger('julian-to-gregorian')
    ..finer('Converting Julian Date $jd to Gregorian calendar.');

  final us = (jd * _kMicrosecondsInOneDay).toInt();
  final duration = Duration(microseconds: us);
  final dateTime = _kJulianEpoch.add(duration);

  log.finer('Julian Date $jd converted to Gregorian date and time $dateTime.');
  return dateTime;
}

/// Creates a [Logger] with the name prefixed with 'libcalendar'.
Logger _createLogger(String methodName) => Logger('libcalendar/$methodName');

// ################################## CLASSES ##################################
/// Error thrown by calendar converter methods when any invalid operation
/// occurs.
class CalendarConversionError extends Error {
  // ------------------------------- CONSTRUCTORS ------------------------------
  /// Constructs new [CalendarConversionError] with given [reason].
  CalendarConversionError(this.reason);

  // ---------------------------------- FIELDS ---------------------------------
  /// The reason of the error. This will be a string describing the invalid
  /// operation occurs when the calendar converter method is called.
  final String reason;
}
