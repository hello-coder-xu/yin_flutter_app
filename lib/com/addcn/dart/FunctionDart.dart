import 'package:meta/meta.dart';

void calculateOne(int a, [int b = 1, int c]) {
  print('a=$a b=$b c=$c');
}

void calculateTwo(int a, {b, c = 0, @required d}) {
  print('a=$a b=$b c=$c d=$d');
}

typedef Adder = int Function(int, int);

Adder makeAdder(int sum) {
  return (a, b) => a + b + sum;
}

void main() {
  var adder = makeAdder(5);
  var value = adder(1, 2);
  print("$value");
}
