/// String Calculator implements the classic TDD kata.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    return sum(split(numbers));
  }

  List<String> split(String numbers) {
    if (numbers.startsWith('//')) {
      String delimiter = numbers[2];
      String rest = numbers.substring(4);
      return _splitNumbers(rest, delimiter);
    }
    return _splitNumbers(numbers, ',');
  }

  List<String> _splitNumbers(String numbers, String delimiter) {
    return numbers
        .replaceAll('\n', delimiter)
        .split(delimiter)
        .where((s) => s.isNotEmpty)
        .toList();
  }

  int sum(List<String> numbers) {
    return numbers.map(int.parse).reduce((a, b) => a + b);
  }
}
