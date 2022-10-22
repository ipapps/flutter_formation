class Animal {
  eat() {}
}

class Bird extends Animal {
  hatch() {}
}

class Fish extends Animal {
  swim() {}
}

mixin Flyer {
  fly() {}
}

class FlyingFish extends Fish with Flyer {}
class Dodo extends Bird {}

main() {
  final flyingFish = FlyingFish();
  final dodo = Dodo();

  flyingFish.fly();
  //dodo.fly(); DOES NOT EXIST
}
