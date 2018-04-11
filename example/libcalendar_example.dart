import 'package:libcalendar/libcalendar.dart';

void main() {
  // September 7th, 2010 in Gregorian.
  const int year = 2010;
  const int month = 9;
  const int day = 7;

  // Convert to CJDN.
  final int cjdn = fromGregorianToCJDN(year, month, day);
  print('September 7th, 2010 in CJDN: $cjdn');

  // Convert to Islamic.
  final DateTime islamic = fromGregorianToIslamic(year, month, day);
  print('September 7th, 2010 in Islamic: ${islamic.day}/${islamic.month}/${islamic.year}');
}
