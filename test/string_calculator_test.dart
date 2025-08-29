import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group("String Calculator", () {
    test("returns 0 for empty string", () {
      final calc = StringCalculator();
      expect(calc.add(""), 0);
    });
  });
}
