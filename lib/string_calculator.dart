class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiterPattern = '[,\n]'; // default delimiters
    String input = numbers;

    // Check for custom delimiter prefix
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterLine = parts[0]; // e.g., "//;"
      input = parts.sublist(1).join('\n'); // remaining string after first line

      // Extract delimiter from //;
      final delimiter = delimiterLine.substring(2);
      delimiterPattern = RegExp.escape(delimiter); // escape special chars
    }

    final tokens = input.split(RegExp(delimiterPattern));

    int sum = 0;
    for (var token in tokens) {
      if (token.isNotEmpty) {
        sum += int.parse(token);
      }
    }

    return sum;
  }
}
