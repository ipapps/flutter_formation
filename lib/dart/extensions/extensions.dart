import 'package:flutter_formation/dart/extensions/strings_ext.dart';

void extensions() {
  const String myString = "Je suis un Grand Garçon";
  print(myString.reversed());
  print(myString < "Je suis un Garçon");
  print(myString < "Je suis un très Grand Garçon");
  print(myString.numberOfUpperCase);
}
