/// String Calculator implements the classic TDD kata.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    return sum(split(numbers));
  }

  List<String> split(String numbers) {
    if (!numbers.contains(',')) return [numbers];
    return numbers.split(',');
  }

  int sum(List<String> numbers) {
    return numbers.map(int.parse).reduce((a, b) => a + b);
  }
}
