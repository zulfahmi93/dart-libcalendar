# Calendar Conversion Library for Dart

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


## How to use

A simple usage example:

```dart
import 'package:libcalendar/libcalendar.dart';

  void main() {
   // September 7th, 2010 in Gregorian.
  final int year = 2010;
  final int month = 9;
  final int day = 7;

  // Convert to CJDN.
  print(fromGregorianToCJDN(year, month, day));

  // Convert to Islamic.
  final DateTime islamic = fromGregorianToIslamic(year, month, day);
  print(islamic);
}
```

## Features and Bugs

Please file feature requests and bugs at the [issue tracker][tracker].


## License

This project is licensed under the MIT License - see the [LICENSE][license] file for details.

[tracker]: https://github.com/zulfahmi93/dart_libcalendar/issues
[license]: https://github.com/zulfahmi93/dart_libcalendar/blob/dev/LICENSE
