import 'package:flutter_formation/dart/classes/a.dart';

class B extends A {
  final String b;

  B(this.b)
      : name = "David",
        surname = "Fournier",
        super("a");

  B.withAllParameters(this.b, this.name, this.surname) : super("a");

  factory B.named(String name, String surname) {
    return B.withAllParameters("b", name, surname);
  }

  String giveString() => "toto";

  String name;
  String surname;

  String get fullName => "$name $surname";

  set fullName(String newString) {
    name = newString.split(' ')[0];
    surname = newString.split(' ')[1];
  }
}