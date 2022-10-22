import 'package:flutter_formation/dart/classes/a.dart';
import 'package:flutter_formation/dart/classes/b.dart';
import 'package:flutter_formation/dart/classes/c.dart';

void classes() {
  final a = A("hello");
  final b = B("hello");
  final bWithParameters = B.withAllParameters('hello', 'David', 'Fournier');
  final bNamed = B.named("David", "Fournier");

  print(a.a);
  print(b.b);
  print(b.a);
  print(b.absInt);

  print(bWithParameters.b);
  print(bNamed.b);

  print(b.fullName);
  b.fullName = "Vincent Bencardino";
  print("${b.name} ${b.surname}");

  final c = C(1, required: "required");

  print(c.notNamed);
  print(c.required);
  print(c.optional);
  print(c.nullable);
  print(c.canBeDoneLater);
  c.canBeDoneLater = "toto";
  print(c.canBeDoneLater);
  try {
    print(c.canBeDoneLaterButCanCrash);
  } catch (e) {
    print(e);
  }
  c.canBeDoneLaterButCanCrash = "titi";
  try {
    print(c.canBeDoneLaterButCanCrash);
  } catch (e) {
    print(e);
  }
}