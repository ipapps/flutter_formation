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
