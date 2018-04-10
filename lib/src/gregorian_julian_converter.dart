///
/// Provides methods for performing calendar conversion.
///
class CalendarConverter {
  ///
  /// Convert a date time in Gregorian calendar given in [gregorianInUtc]
  /// parameter (ensure the date is in UTC) to Julian day.
  ///
  static double gregorianToJulianDay(DateTime gregorianInUtc) {
    // Step 1: Check UTC-ness.
    if (!gregorianInUtc.isUtc) {
      throw new _CalendarConversionError(
          'Parameter [gregorianInUtc] should be passed in UTC date time format!');
    }

    // Conversion step reference: https://quasar.as.utexas.edu/BillInfo/JulianDatesG.html
    final int day = gregorianInUtc.day;

    // If month is January or February, add 12 to month.
    final int month = gregorianInUtc.month < 3
        ? gregorianInUtc.month + 12
        : gregorianInUtc.month;

    // If month is January or February, subtract 1 from year.
    final int year = gregorianInUtc.month < 3
        ? gregorianInUtc.year - 12
        : gregorianInUtc.year;

    final int A = year ~/ 100;
    final int B = A ~/ 4;
    final int C = 2 - A + B;
    final int E = (365.25 * (year + 4716)).toInt();
    final int F = (30.6001 * (month + 1)).toInt();
    final double julianDay = C + day + E + F - 1524.5;

    return julianDay;
  }
}

///
/// Contains error information thrown by [CalendarConverter] class.
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
