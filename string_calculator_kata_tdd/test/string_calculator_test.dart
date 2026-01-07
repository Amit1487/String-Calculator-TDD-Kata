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
      expect(calculator.add('1,2'), equals(3));
      expect(calculator.add('1,1'), equals(2));
    });

    /// this test case does not require any implementation as it works with the existing implementation
    test('handles sum for multiple numbers', () {
      expect(calculator.add('1,2,3,4,5'), 15);
    });

    test('handles newlines and multiple commas', () {
      expect(calculator.add('1\n2,3'), equals(6));
      expect(calculator.add('1,\n2'), equals(3));
      expect(calculator.add('1,,3'), equals(4));
    });

    test('supports custom delimiters', () {
      expect(calculator.add('//;\n1;2'), equals(3));
      expect(calculator.add('//|\n1|2|3'), equals(6));
    });

    test('ignore numbers > 1000', () {
      expect(calculator.add('1000,1'), equals(1001));
      expect(calculator.add('2000,1'), equals(1));
    });

    test('negative numbers throws exception', () {
      expect(() => calculator.add('2,-3,4'), throwsArgumentError);
    });
  });
}
