import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_kata_tdd/string_calculator.dart';

void main() {
 test('returns 0 for empty string', () {
      expect(StringCalculator().add(''), equals(0));
    });
}
