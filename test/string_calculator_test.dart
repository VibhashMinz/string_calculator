import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String Calculator", () {
    test("returns 0 for empty string", () {
      final calc = StringCalculator();
      expect(calc.add(""), 0);
    });

    test("return the number itself when only one is given as input", () {
      final calc = StringCalculator();
      expect(calc.add("5"), 5);
    });

    test("returns sum of two numbers separated by comma", () {
      final calc = StringCalculator();
      expect(calc.add("4,3"), 7);
    });
    test("returns sum of multiple numbers separated by commas", () {
      final calc = StringCalculator();
      expect(calc.add("4,3,7"), 14);
    });

    test("handles new lines as delimiters", () {
      final calc = StringCalculator();
      expect(calc.add("1,\n2,5"), equals(8));
    });
  });
}
