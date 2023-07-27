//helper class here..

import 'dart:math';

class Util {
  void generateRandomCombination(List<int> arr, int maxRange, int maxNumber) {
    Random random = Random();

    while (arr.length != maxNumber) {
      var number = random.nextInt(maxRange);
      if (!arr.contains(number) && number > 0) {
        arr.add(number);
      }
    }
  }
}
