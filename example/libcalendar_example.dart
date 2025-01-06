import 'dart:io';

import 'package:libcalendar/libcalendar.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (record) {
      final prefix = '[${record.level.name.padRight(7)}: ${record.loggerName}]';
      stdout.writeln(
        '${prefix.padRight(56)} ${record.message}',
      );
    },
  );

  final log = Logger('libcalendar/example');

  // September 7th, 2010 in Gregorian.
  const year = 2010;
  const month = 9;
  const day = 7;

  // Convert to CJDN.
  final cjdn = fromGregorianToCjdn(year, month, day);
  log.info('September 7th, 2010 in CJDN: $cjdn');

  // Convert to Islamic.
  final islamic = fromGregorianToIslamic(year, month, day);
  log.info(
    'September 7th, 2010 in Islamic: '
    '${islamic.day}/${islamic.month}/${islamic.year}',
  );
}
