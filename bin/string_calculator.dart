import 'package:string_calculator/string_calculator.dart';

void main(List<String> arguments) {
  final calc = StringCalculator();

  print('Empty string => ${calc.add("")}');
  print('"1" => ${calc.add("1")}');
}
