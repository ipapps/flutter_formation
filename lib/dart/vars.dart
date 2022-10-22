// ignore_for_file: avoid_print
import 'dart:async';

void main() {

  //variables();
  //nullSafety();
  //containers();
  //controlStructures();
  //functions();
  //extensions();
  //enums();
}

void enums() {
  for(final planet in Planet.values) {
    print("La planète ${planet.name} s'appelle : ${planet.frenchName}");
  }

  Planet findPlanet() {
    return Planet.earth;
  }

  final planet = findPlanet();

  switch (planet) {
    case Planet.mercury:
    case Planet.venus:
    case Planet.mars:
    case Planet.earth:
      print("planète tellurique");
      break;
    case Planet.jupiter:
    case Planet.saturn:
    case Planet.uranus:
    case Planet.neptune:
      "Planète gazeuse";
      break;
  }

  print(Planet.earth.position);
}

enum Planet {
  mercury("Mercure"),
  venus("Venus"),
  earth("Terre"),
  mars("Mars"),
  jupiter("Jupiter"),
  saturn("Saturne"),
  uranus("Uranus"),
  neptune("Neptune");

  final String frenchName;

  const Planet(this.frenchName);

  int get position {
    return Planet.values.indexOf(this) + 1;
  }
}

void extensions() {
  const String myString = "Je suis un Grand Garçon";
  print(myString.reversed());
  print(myString < "Je suis un Garçon");
  print(myString < "Je suis un très Grand Garçon");
  print(myString.numberOfUpperCase);
}

extension StringsExtensions on String {
  String reversed() {
    return split('').reversed.join();
  }

  int get numberOfUpperCase {
    return split('').where((element) => element.toUpperCase() == element).length;
  }

  operator <(String other) {
    return length < other.length;
  }
}

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
  A.printThis(true, (boolean) => "Toujours pareil");
}

void printThis(bool boolean, String Function(bool boolean) transformation) {
  print(transformation.call(boolean));
}

class A {
  static void printThis(bool boolean, String Function(bool boolean) transformation) {
    print(transformation.call(boolean));
  }
}

void containers() {
  List list = [1, "coucou"];
  //List<String> stringList = [1, 2]; DOES NOT COMPILE
  List<String> stringList = ["hello", "coucou", "holà", "👋"];

  print(stringList);

  stringList.add("hej");

  print(stringList);
  print(stringList.length);

  print(stringList.reversed.toList());

  stringList.removeAt(1);

  print(stringList);

  print(stringList.where((element) => element.contains("h")).toList());

  print(stringList.where((element) => element.contains("z")).toList());

  print(stringList.join("-"));

  List<String> secondStringList = ["ciao"];

  List<String> thirdList = stringList + secondStringList + secondStringList;

  print(thirdList);
  print(Set.of(thirdList));

  final generatedList = List.generate(10, (index) => index);
  print(generatedList);

  Map<String, int> wordLengths = {};

  for (final element in thirdList) {
    wordLengths[element] = element.length;
  }

  print(wordLengths);

  for (final element in thirdList) {
    wordLengths[element] = element.runes.length;
  }

  print(wordLengths);
}

void controlStructures() {
  bool condition = true;
  if (condition) {
  } else if (!condition) {
  } else {}

  print(condition ? "true" : "false");

  printMyWord(String word) {
    switch (word) {
      case "toto":
        print("Je suis toto");
        break;
      case "hello":
        print("Bonjour à tous");
        break;
      default:
        print(word);
    }
  }

  printMyWord("toto");
  printMyWord("hello");
  printMyWord("coucou");

  final words = ["a", "b", "c", "d", "e"];
  var words2 = [
    "a",
    "b",
    "c",
    "d",
    "e",
  ];

  String concatenation = "";
  for (final word in words) {
    concatenation = concatenation + word;
  }
  print(concatenation);

  concatenation = "";
  for (int i = 0; i < words.length; i++) {
    concatenation += words[i];
  }
  print(concatenation);

  concatenation = "";
  words.forEach((element) {
    concatenation += element;
  });
  print(concatenation);

  concatenation = "";
  while (words2.isNotEmpty) {
    concatenation += words2.removeAt(0);
  }
  print(concatenation);
  print(words2.length);

  words2 = words.map((e) => e.toUpperCase()).toList();
  print(words2.join());

  concatenation = words.reduce((value, element) => value + element);
  print(concatenation);
}

void nullSafety() {
  String toto;
  //print(toto); DOES NOT COMPILE

  String? titi;
  print(titi);

  toto = "hello";

  print("les variables sont $toto et $titi");

  titi = "goodbye";

  print("maintenant titi vaut $titi");

  titi = null;

  print(toto.length);
  //print(titi.length); DOES NOT COMPILE
  print(titi?.length);
  print("Je préfère dire 0 que null donc la taille de titi est ${titi?.length ?? 0}");

  try {
    print("Je suis sûr de moi pour titi, donc ${titi!.length}");
  } catch (exception) {
    print("En fait je me suis trompé");
    print(exception);
  }
}

void variables() {
  var inferredType = 1;
  print(inferredType.runtimeType);

  dynamic dynamicType = 1;
  print(dynamicType.runtimeType);
  dynamicType = "hello";
  print(dynamicType.runtimeType);

  //inferredType = "hello" DOES NOT COMPILE

  int noPrimitiveType = 1;
  print(noPrimitiveType.isEven);

  final finalVariable = "hello";
  //finalVariable = "goodbye"; DOES NOT COMPILE

  final String finalVariableToCompute;
  if (false) {
    finalVariableToCompute = "hello";
  } else {
    finalVariableToCompute = "goodbye";
  }

  print(finalVariableToCompute); //The final variable 'finalVariableToCompute'
  // can't be read because it's potentially unassigned at this point.

  //const String constString; DOES NOT COMPILE, MUST BE INSTANTIATED
}

void printNumbers() {
  print(1);
  printAfterOneSecond();
  print(3);
}

void printAfterOneSecond() async {
  await Future.delayed(Duration(seconds: 1));
  print(2);
}
