import 'package:logging/logging.dart';

List<int> _kDaysToMonth365 = <int>[0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];
List<int> _kDaysToMonth366 = <int>[0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];
DateTime _kJulianEpoch = new DateTime.utc(-4713, 11, 24, 12, 0);
int _kMicrosecondsInOneDay = 86400000000;


///
/// Sources: http://aa.quae.nl/en/reken/juliaansedag.html
///

///
/// Converts Gregorian calendar, given by parameter [year], [month] and [day]
/// to Chronological Julian Day Number (CJDN).
///
int fromGregorianToCJDN(int year, int month, int day) {
  final Logger log = new Logger('libcalendar-fromGregorianToCJDN()');

  // Check year range.
  if (year < 1900 || year > 2100) {
    const String msg = 'Parameter [year] should be between 1900 to 2100.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  // Check month range.
  if (month < 1 || month > 12) {
    const String msg = 'Parameter [month] should be between 1 to 12.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  // Check day validity for given month.
  final List<int> days = _isGregorianLeapYear(year) ? _kDaysToMonth366 : _kDaysToMonth365;
  final int maxDay = days[month] - days[month - 1];

  if (day < 1 || day > maxDay) {
    final String msg = 'Parameter [day] should be between 1 to $maxDay.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  final int c0 = ((month - 3) / 12).floor();
  final int x4 = year + c0;
  final int x3 = (x4 / 100).floor();
  final int x2 = x4 % 100;
  final int x1 = month - (12 * c0) - 3;
  final int cjdn = ((146097 * x3) / 4).floor() + ((36525 * x2) / 100).floor() + (((153 * x1) + 2) / 5).floor() + day + 1721119;

  log
    ..info('c0 = $c0')
    ..info('x4 = $x4')
    ..info('x3 = $x3')
    ..info('x2 = $x2')
    ..info('x1 = $x1')
    ..info('cjdn = $cjdn');

  return cjdn;
}

///
/// Converts Chronological Julian Day Number (CJDN) given by parameter [cjdn]
/// to Gregorian calendar as [DateTime] object. The [DateTime] object returned
/// will be always in UTC.
///
DateTime fromCJDNtoGregorian(int cjdn) {
  final Logger log = new Logger('libcalendar-fromCJDNtoGregorian()');

  // Check range (1/1/1900 to 31/12/2100).
  if (cjdn < 2415021 || cjdn > 2488434) {
    const String msg = 'Parameter [cjdn] should be between 2415021 to 2488434.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  final int k3 = (4 * cjdn) - 6884477;
  final int x3 = (k3 / 146097).floor();
  final int r3 = k3 % 146097;

  final int k2 = (100 * (r3 / 4).floor()) + 99;
  final int x2 = (k2 / 36525).floor();
  final int r2 = k2 % 36525;

  final int k1 = (5 * (r2 / 100).floor()) + 2;
  final int x1 = (k1 / 153).floor();
  final int r1 = k1 % 153;

  final int c0 = ((x1 + 2) / 12).floor();
  final int day = (r1 / 5).floor() + 1;
  final int month = x1 - (12 * c0) + 3;
  final int year = (100 * x3) + x2 + c0;

  log
    ..info('x3 = $x3')
    ..info('x2 = $x2')
    ..info('x1 = $x1')
    ..info('c0 = $c0')
    ..info('day = $day')
    ..info('month = $month')
    ..info('year = $year');

  return new DateTime.utc(year, month, day);
}

///
/// Converts Islamic calendar, given by parameter [year], [month] and [day]
/// to Chronological Julian Day Number (CJDN).
///
int fromIslamicToCJDN(int year, int month, int day) {
  final Logger log = new Logger('libcalendar-fromIslamicToCJDN()');

  // Check year range.
  if (year < 1317 || year > 1524) {
    const String msg = 'Parameter [year] should be between 1317 to 1524.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  // Check month range.
  if (month < 1 || month > 12) {
    const String msg = 'Parameter [month] should be between 1 to 12.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  // Check day range.
  if (day < 1 || day > 30) {
    const String msg = 'Parameter [day] should be between 1 to 30.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  // Check date range.
  final DateTime date = new DateTime.utc(year, month, day);
  final DateTime min = new DateTime.utc(1317, 8, 28);
  final DateTime max = new DateTime.utc(1528, 10, 30);
  if (date.compareTo(min) < 0 || date.compareTo(max) >= 0) {
    const String msg = 'Invalid Islamic date range. It should be between Sha\'aban 28th, 1317 until Shawwal 29th, 1524.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  final int k2 = (((10631 * year) - 10617) / 30).floor();
  final int k1 = (((325 * month) - 320) / 11).floor();
  final int cjdn = k2 + k1 + day + 1948439;

  log
    ..info('k2 = $k2')
    ..info('k1 = $k1')
    ..info('cjdn = $cjdn');

  return cjdn;
}

///
/// Converts Chronological Julian Day Number (CJDN) given by parameter [cjdn]
/// to Islamic calendar as [DateTime] object. The [DateTime] object returned
/// will be always in UTC.
///
DateTime fromCJDNtoIslamic(int cjdn) {
  final Logger log = new Logger('libcalendar-fromCJDNtoIslamic()');

  // Check range (1/1/1900 to 31/12/2100).
  if (cjdn < 2415021 || cjdn > 2488434) {
    const String msg = 'Parameter [cjdn] should be between 2415021 to 2488434.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  final int k2 = (30 * (cjdn - 1948440)) + 15;
  final int k1 = (11 * ((k2 % 10631) / 30).floor()) + 5;
  final int day = ((k1 % 325) / 11).floor() + 1;
  final int month = (k1 / 325).floor() + 1;
  final int year = (k2 / 10631).floor() + 1;

  log
    ..info('k2 = $k2')
    ..info('k1 = $k1')
    ..info('day = $day')
    ..info('month = $month')
    ..info('year = $year');

  return new DateTime.utc(year, month, day);
}

///
/// Converts Gregorian calendar, given by parameter [year], [month] and [day]
/// to Islamic calendar.
///
DateTime fromGregorianToIslamic(int year, int month, int day) {
  // Convert to CDJN.
  final int cjdn = fromGregorianToCJDN(year, month, day);

  // Convert to Islamic.
  final DateTime islamic = fromCJDNtoIslamic(cjdn);
  return islamic;
}

///
/// Converts Islamic calendar, given by parameter [year], [month] and [day]
/// to Gregorian calendar.
///
DateTime fromIslamicToGregorian(int year, int month, int day) {
  // Convert to CDJN.
  final int cjdn = fromIslamicToCJDN(year, month, day);

  // Convert to Gregorian.
  final DateTime gregorian = fromCJDNtoGregorian(cjdn);
  return gregorian;
}

///
/// Check whether given Gregorian year is a leap year.
///
bool _isGregorianLeapYear(int year) {
  return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
}

///
/// Converts Gregorian date and time, given by parameter [dateTimeInUtc]
/// to Julian Date.
///
double fromGregorianToJulianDate(DateTime dateTimeInUtc) {
  assert(dateTimeInUtc != null);
  final Logger log = new Logger('libcalendar-fromGregorianToJulianDate()');

  // Check UTC-ness.
  if (!dateTimeInUtc.isUtc) {
    const String msg = 'Parameter [dateTimeInUtc] should be in UTC.';
    log.severe(msg);
    throw new _CalendarConversionError(msg);
  }

  final Duration difference = dateTimeInUtc.difference(_kJulianEpoch);
  final double jd = difference.inMicroseconds / _kMicrosecondsInOneDay;

  return jd;
}

///
/// Converts Julian Date given by parameter [jd]to Gregorian date and time as
/// [DateTime] object. The [DateTime] object returned will be always in UTC.
///
DateTime fromJulianDateToGregorian(double jd) {
  assert(jd != null);

  final int us = (jd * _kMicrosecondsInOneDay).toInt();
  final Duration duration = new Duration(microseconds: us);
  final DateTime dateTime = _kJulianEpoch.add(duration);

  return dateTime;
}

///
/// Contains error information thrown by calendar converter methods.
///
class _CalendarConversionError extends Error {
  /* BEGIN FIELD SECTION */

  /// Brief message which tells why the error occured.
  final String reason;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [_CalendarConversionError].
  ///
  _CalendarConversionError(this.reason);

  /* END CONSTRUCTOR SECTION */
}
