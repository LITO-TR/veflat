import 'dart:math';

double generateRandomNumber() {
  Random random = Random();

  // Generate a random number between 80 and 200
  double randomNumber = 80 + random.nextDouble() * (200 - 80);

  // Format to 2 decimal places
  return double.parse(randomNumber.toStringAsFixed(2));
}
