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