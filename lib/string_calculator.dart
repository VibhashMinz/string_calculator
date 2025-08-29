class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    //If input has a single number, just parse and return it.
    return int.parse(numbers);
  }
}
