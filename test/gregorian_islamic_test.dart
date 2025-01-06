import 'package:libcalendar/libcalendar.dart';
import 'package:test/test.dart';

void main() {
  group(
    'fromIslamicToGregorian() method tests.',
    fromIslamicToGregorianConvertShaaban29th1432ToGregorian,
  );
  group(
    'fromGregoriantoIslamic() method tests.',
    fromGregoriantoIslamicConvertJuly31st2011ToIslamic,
  );
}

void fromIslamicToGregorianConvertShaaban29th1432ToGregorian() {
  test('Convert Sha\'aban 29th, 1432 to Gregorian.', () {
    expect(
      fromIslamicToGregorian(1432, 8, 29),
      equals(DateTime.utc(2011, 7, 31)),
    );
  });
}

void fromGregoriantoIslamicConvertJuly31st2011ToIslamic() {
  test('Convert July 31st, 2011 to Islamic.', () {
    expect(
      fromGregorianToIslamic(2011, 7, 31),
      equals(DateTime.utc(1432, 8, 29)),
    );
  });
}
