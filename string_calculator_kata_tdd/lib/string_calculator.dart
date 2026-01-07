/// String Calculator implements the classic TDD kata.
class StringCalculator {
  int _callCount = 0;

  int getCalledCount() {
    return _callCount;
  }

  /// Adds numbers in the given string and returns the sum.
  int add(String numbers) {
    _callCount++;

    if (numbers.isEmpty) return 0;
    try {
      return sum(split(numbers));
    } catch (e) {
      rethrow;
    }
  }

  List<String> split(String numbers) {
    if (numbers.startsWith('//')) {
      int newlineIndex = numbers.indexOf('\n');
      if (newlineIndex == -1) return [];

      String delimiterPart = numbers.substring(2, newlineIndex);
      String rest = numbers.substring(newlineIndex + 1);

      List<String> delimiters = [];
      int start = 0;
      while (start < delimiterPart.length) {
        if (delimiterPart.startsWith('[', start)) {
          int end = delimiterPart.indexOf(']', start + 1);
          if (end != -1) {
            delimiters.add(delimiterPart.substring(start + 1, end));
            start = end + 1;
          } else {
            break;
          }
        } else {
          delimiters.add(delimiterPart[start]);
          start++;
        }
      }

      return _splitNumbers(rest, delimiters);
    }
    return _splitNumbers(numbers, [',']);
  }

  List<String> _splitNumbers(String numbers, List<String> delimiters) {
    String normalized = numbers.replaceAll('\n', delimiters[0]);
    for (String delimiter in delimiters) {
      normalized = normalized.replaceAll(delimiter, ',');
    }
    return normalized.split(',').where((s) => s.isNotEmpty).toList();
  }

  int sum(List<String> numbers) {
    var negatives = <String>[];
    for (String numberStr in numbers) {
      if (numberStr.isNotEmpty && double.tryParse(numberStr) == null) {
        throw FormatException('Invalid number: $numberStr');
      }

      int number = int.parse(numberStr);
      if (number < 0) {
        negatives.add(numberStr);
      }
    }

    if (negatives.isNotEmpty) {
      throw ArgumentError(
          'Negatives numbers are not allowed: ${negatives.join(',')}');
    }

    return numbers
        .where((n) => int.parse(n) <= 1000)
        .map(int.parse)
        .fold(0, (a, b) => a + b);
  }
}
