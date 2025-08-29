class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    //Split by comma OR new line

    final parts = numbers.split(RegExp('[,\n]')); //cuts the string anywhere you see a comma , or newline \n
    //"1,\n2" --> ['1', '', '2']; will cause FormatException on int.parse();

    int sum = 0;

    for (var part in parts) {
      if (part.isNotEmpty) {
        sum += int.parse(part);
      }
    }

    return sum;
  }
}
