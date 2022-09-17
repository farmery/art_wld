import 'dart:math';

class Math {
  static int random(int min, int max) {
    return min + Random().nextInt(max - min);
  }
}
