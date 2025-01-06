# Calendar Conversion Library for Dart

[![Pub](https://img.shields.io/pub/v/libcalendar.svg?style=flat-square)](https://pub.dartlang.org/packages/libcalendar)

[//]: # ([![Build Status]&#40;https://img.shields.io/travis/zulfahmi93/dart_libcalendar.svg?style=flat-square&#41;]&#40;https://travis-ci.org/zulfahmi93/dart_libcalendar&#41;)

This library defines the following methods for calendar conversion:
- `fromGregorianToCJDN()`
  - Gregorian calendar to Chronological Julian Day Number (CJDN) conversion.
- `fromCJDNtoGregorian()`
  - Chronological Julian Day Number (CJDN) to Gregorian calendar conversion.
- `fromIslamicToCJDN()`
  - Islamic calendar to Chronological Julian Day Number (CJDN) conversion.
- `fromCJDNtoIslamic()`
  - Chronological Julian Day Number (CJDN) to Islamic calendar conversion.
- `fromGregorianToIslamic()`
  - Gregorian calendar to Islamic calendar conversion.
- `fromIslamicToGregorian()`
  - Islamic calendar to Gregorian calendar conversion.
- `fromGregorianToJulianDate()`
  - Gregorian calendar to Julian Date conversion.
- `fromJulianDateToGregorian()`
  - Julian Date to Gregorian calendar conversion.


## How to use

1. Open your `pubspec.yaml` file and add this entry:

    ```yaml
    libcalendar: ^0.2.0
    ```

2. Then run `pub get`.
3. Import this library into your code:

    ```dart
    import 'package:libpray/libcalendar.dart';
    ```

A simple usage example:

```dart
import 'package:libcalendar/libcalendar.dart';

void main() {
  // September 7th, 2010 in Gregorian.
  final int year = 2010;
  final int month = 9;
  final int day = 7;

  // Convert to CJDN.
  final int cjdn = fromGregorianToCJDN(year, month, day);
  print('September 7th, 2010 in CJDN: $cjdn');

  // Convert to Islamic.
  final DateTime islamic = fromGregorianToIslamic(year, month, day);
  print('September 7th, 2010 in Islamic: ${islamic.day}/${islamic.month}/${islamic.year}');
}
```

The output should be as follows:

```
September 7th, 2010 in CJDN: 2455447
September 7th, 2010 in Islamic: 28/9/1431
```

## Features and Bugs

Please file feature requests and bugs at the [issue tracker][tracker].


## License

This project is licensed under the MIT License - see the [LICENSE][license] file for details.

[tracker]: https://github.com/zulfahmi93/dart_libcalendar/issues
[license]: LICENSE
