import 'package:test/test.dart';

import 'from_cjdn_to_gregorian_test.dart';
import 'from_gregorian_to_cjdn_test.dart';

void main() {
  // Uncomment the code below to show log.
//  Logger.root.level = Level.ALL;
//  Logger.root.onRecord.listen((LogRecord lr) {
//    print('${lr.level.name}: ${lr.time}: ${lr.message}');
//  });
  testCalendarConverterDartFile();
}

void testCalendarConverterDartFile() {
  group('calendar_converter.dart tests.', () {
    //
    // fromGregorianToCJDN().
    //
    group('fromGregorianToCJDN() method tests.', () {
      fromGregorianToCJDNYearParameterLessThan1900();
      fromGregorianToCJDNYearParameterMoreThan2100();
      fromGregorianToCJDNMonthParameterLessThan1();
      fromGregorianToCJDNMonthParameterMoreThan12();
      fromGregorianToCJDNDayParameterLessThan1();
      fromGregorianToCJDNDayParameterMoreThan31();
      fromGregorianToCJDNConvertSeptember7th2010ToCJDN();
      fromGregorianToCJDNConvertFebruary29th2000ToCJDN();
      fromGregorianToCJDNConvertMarch1st2000ToCJDN();
      fromGregorianToCJDNConvertFebruary28th2001ToCJDN();
      fromGregorianToCJDNConvertMarch1st2001ToCJDN();
      fromGregorianToCJDNConvertFebruary28th2100ToCJDN();
      fromGregorianToCJDNConvertMarch1st2100ToCJDN();
    });

    //
    // fromCJDNtoGregorian().
    //
    group('fromCJDNtoGregorian() method tests.', () {
      fromCJDNtoGregorianCjdnParameterLessThan2415021();
      fromCJDNtoGregorianCjdnParameterMoreThan2488434();
      fromCJDNtoGregorianConvert2452827ToGregorian();
      fromCJDNtoGregorianConvert2451604ToGregorian();
      fromCJDNtoGregorianConvert2451605ToGregorian();
      fromCJDNtoGregorianConvert2451969ToGregorian();
      fromCJDNtoGregorianConvert2451970ToGregorian();
      fromCJDNtoGregorianConvert2488128ToGregorian();
      fromCJDNtoGregorianConvert2488129ToGregorian();
    });
  });
}
