import 'package:flutter_test/flutter_test.dart';
import 'package:rental/models/itemCondition.dart';

void main() {
  test('indexOfEnums', ()
  {
    expect(ItemCondition.Good.index, 0);
    expect(ItemCondition.NotSoGood.index, 1);
    expect(ItemCondition.Medium.index, 2);
    expect(ItemCondition.NotRealyBad.index, 3);
    expect(ItemCondition.Bad.index, 4);
  });
}