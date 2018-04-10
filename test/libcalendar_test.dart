import 'package:test/test.dart';

import 'cjdn_islamic.dart';
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

    //
    // fromIslamicToCJDN().
    //
    group('fromIslamicToCJDN() method tests.', () {
      fromIslamicToCJDNYearParameterLessThan1317();
      fromIslamicToCJDNYearParameterMoreThan1524();
      fromIslamicToCJDNMonthParameterLessThan1();
      fromIslamicToCJDNMonthParameterMoreThan12();
      fromIslamicToCJDNDayParameterLessThan1();
      fromIslamicToCJDNDayParameterMoreThan30();
      fromIslamicToCJDNDateBeforeShaaban28th1317();
      fromIslamicToCJDNDateAfterShawwal29th1524();
      fromIslamicToCJDNConvertShaaban29th1432ToCJDN();
    });

    //
    // fromCJDNtoIslamic().
    //
    group('fromCJDNtoIslamic() method tests.', () {
      fromCJDNtoIslamicCjdnParameterLessThan2415021();
      fromCJDNtoIslamicCjdnParameterMoreThan2488434();
      fromCJDNtoIslamicConvert2455774ToGregorian();
    });
  });
}
