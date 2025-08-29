// lib/string_calculator.dart
class StringCalculator {
  int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    String delimiterPattern = r'[,\n]'; // default delimiters: comma OR newline
    String input = numbers;

    // Check for custom delimiter prefix
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterLine = parts[0]; // e.g., "//;"
      // everything after the first line is the actual input
      input = parts.length > 1 ? parts.sublist(1).join('\n') : '';

      // Extract delimiter from "//;"
      final delimiter = delimiterLine.substring(2);
      // Escape it so regex treats special characters literally
      delimiterPattern = RegExp.escape(delimiter);
    }

    final tokens = input.split(RegExp(delimiterPattern));

    final negatives = <int>[];
    int sum = 0;

    for (var token in tokens) {
      final t = token.trim();
      if (t.isEmpty) continue; // skip accidental empty pieces like "1,\n2" -> ["1","","2"]

      final value = int.parse(t); // may throw FormatException if token isn't numeric (ok)
      if (value < 0) {
        negatives.add(value);
      } else {
        sum += value;
      }
    }

    if (negatives.isNotEmpty) {
      // Build the required message and throw
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return sum;
  }
}
