import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_kata_tdd/string_calculator.dart';

void main() {
  late StringCalculator calculator;

  setUp(() {
    calculator = StringCalculator();
  });
  group('String Calculator tests', () {
    test('returns 0 for empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('single number returns itself', () {
      expect(calculator.add('1'), equals(1));
      expect(calculator.add('5'), equals(5));
    });

    test('sum two comma separated numbers', () {
      expect(StringCalculator().add('1,2'), equals(3));
      expect(StringCalculator().add('1,1'), equals(2));
    });

    /// this test case does not require any implementation as it works with the existing implementation
    test('handles sum for multiple numbers', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });

    test('handles newlines and multiple commas', () {
      expect(StringCalculator().add('1\n2,3'), equals(6));
      expect(StringCalculator().add('1,\n2'), equals(3));
      expect(StringCalculator().add('1,,3'), equals(4));
    });

    test('supports custom delimiters', () {
      expect(StringCalculator().add('//;\n1;2'), equals(3));
      expect(StringCalculator().add('//|\n1|2|3'), equals(6));
    });
  });
}
