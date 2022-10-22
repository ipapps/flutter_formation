import 'package:flutter_formation/dart/enums/planet.dart';

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
