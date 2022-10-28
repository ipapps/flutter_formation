import 'package:flutter_formation/dart/classes/abs.dart';

class A implements Abs, Abs2 {
  final String a;
  late String other;

  A(this.a)
      : absInt = 2,
        absInt2 = 4 {
  }

  @override
  abs() {
    print("abs method implemented");
  }

  @override
  int absInt;

  @override
  int absInt2;
}
