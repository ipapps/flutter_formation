import 'package:flutter_formation/dart/classes/abs.dart';

class A implements Abs, Abs2 {
  final String a;

  A(this.a) :
        absInt = 2;

  @override
  abs() {
    print("abs method implemented");
  }

  @override
  int absInt;
}