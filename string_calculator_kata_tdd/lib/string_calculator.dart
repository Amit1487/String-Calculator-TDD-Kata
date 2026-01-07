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
    var negatives = numbers.where((n) => int.parse(n) < 0);
    if (negatives.isNotEmpty) {
      throw ArgumentError('Negatives numbers are not allowed: ${negatives.join(',')}');
    }

    return numbers
        .where((n) => int.parse(n) <= 1000)
        .map(int.parse)
        .fold(0, (a, b) => a + b);
  }
}
