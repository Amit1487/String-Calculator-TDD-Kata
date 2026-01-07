/// String Calculator implements the classic TDD kata.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    if (!numbers.contains(',')) return int.parse(numbers);

    var parts = numbers.split(',');
    return int.parse(parts[0]) + int.parse(parts[1]);
  }
}
