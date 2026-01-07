/// String Calculator implements the classic TDD kata.
class StringCalculator {
  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    return sum(split(numbers));
  }

  List<String> split(String numbers) {
    return numbers
        .replaceAll('\n', ',') // Normalize newlines to delimiter
        .split(',')
        .where((s) => s.isNotEmpty) // Filter empty strings!
        .toList();
  }

  int sum(List<String> numbers) {
    return numbers.map(int.parse).reduce((a, b) => a + b);
  }
}
