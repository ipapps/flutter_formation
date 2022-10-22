import 'package:flutter_formation/dart/functions/printer.dart';

void functions() {
  String frenchBoolean(bool boolean) {
    return boolean ? "vrai" : "faux";
  }

  String toto = "toto";

  String Function(bool) myFunction = frenchBoolean;
  final shoutingBoolean = (bool boolean) {
    return boolean ? "TRUE" : "FALSE";
  };
  final pythonBoolean = (boolean) => boolean ? "True" : "False";

  printThis(true, myFunction);
  printThis(true, shoutingBoolean);
  printThis(true, pythonBoolean);
  Printer.printThis(true, (boolean) => "Toujours pareil");
}

void printThis(bool boolean, String Function(bool boolean) transformation) {
  print(transformation.call(boolean));
}