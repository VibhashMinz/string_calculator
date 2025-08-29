class StringCalculator {
  int add(String numbers) {
    if (numbers.trim().isEmpty) return 0;

    String delimiterPattern = r'[,\n]'; // default delimiters: comma OR newline
    String input = numbers;

    // Check for custom delimiter prefix
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      final delimiterLine = parts[0]; // e.g., "//[***][%]"
      input = parts.length > 1 ? parts.sublist(1).join('\n') : '';

      //  Handle multiple/long delimiters inside [ ]
      if (delimiterLine.contains('[')) {
        final regex = RegExp(r'\[(.*?)\]');
        final matches = regex.allMatches(delimiterLine);

        // Collect all delimiters
        final delimiters = matches.map((m) => RegExp.escape(m.group(1)!)).toList();

        // Build combined regex: ***|%|foo|bar
        delimiterPattern = delimiters.join('|');
      } else {
        //  Single-char delimiter case, e.g. "//;"
        final delimiter = delimiterLine.substring(2);
        delimiterPattern = RegExp.escape(delimiter);
      }
    }

    //  Split input using regex of one or more delimiters
    final tokens = input.split(RegExp(delimiterPattern));

    final negatives = <int>[];
    int sum = 0;

    for (var token in tokens) {
      final t = token.trim();
      if (t.isEmpty) continue;

      final value = int.parse(t);
      if (value < 0) {
        negatives.add(value);
      } else if (value <= 1000) {
        sum += value;
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return sum;
  }
}
