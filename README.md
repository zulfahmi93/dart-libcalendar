# Calendar Conversion Library
A Dart library for converting dates between Gregorian, Islamic, CJDN, and Julian calendars.

[![Pub](https://img.shields.io/pub/v/libcalendar.svg?style=flat-square)](https://pub.dartlang.org/packages/libcalendar)
![Unit Test Status](https://img.shields.io/github/actions/workflow/status/zulfahmi93/dart-libcalendar/test.yaml?style=flat-square&label=unit%20tests)

Refer to the following table for conversion between calendars:

| From      | To        | Method to use                 |
|-----------|-----------|-------------------------------|
| Gregorian | CJDN      | `fromGregorianToCjdn()`       |
| CJDN      | Gregorian | `fromCjdnToGregorian()`       |
| Islamic   | CJDN      | `fromIslamicToCjdn()`         |
| CJDN      | Islamic   | `fromCjdnToIslamic()`         |
| Gregorian | Islamic   | `fromGregorianToIslamic()`    |
| Islamic   | Gregorian | `fromIslamicToGregorian()`    |
| Gregorian | Julian    | `fromGregorianToJulianDate()` |
| Julian    | Gregorian | `fromJulianDateToGregorian()` |


## Features and Bugs

Please file feature requests and bugs at the [issue tracker][tracker].


## License

This project is licensed under the MIT License - see the [LICENSE][license] file for details.

[tracker]: https://github.com/zulfahmi93/dart_libcalendar/issues
[license]: LICENSE
