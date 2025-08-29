class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    if (numbers.contains(",")) {
      final parts = numbers.split(",");
      int sum = 0;
      for (var part in parts) {
        final number = int.parse(part);
        sum += number;
      }
      return sum;
    }

    //If input has a single number, just parse and return it.
    return int.parse(numbers);
  }
}
