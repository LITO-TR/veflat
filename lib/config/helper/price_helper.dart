import 'dart:math';

double generateRandomNumber() {
  Random random = Random();

  double randomNumber = 80 + random.nextDouble() * (200 - 80);

  return double.parse(randomNumber.toStringAsFixed(2));
}
