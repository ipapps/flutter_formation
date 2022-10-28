void controlStructures() {
  bool condition = true;

  final hello = """
Un long string
Avec des retours chariots
  """;
  print(hello);
  print(condition ? 'true' : "false");

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
  for (var word in words) {
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
    words[1] = "";
    print(element);
    concatenation += element;
  });

  concatenation = "";
  while (words2.isNotEmpty) {
    concatenation += words2.removeAt(0);
  }
  print(concatenation);
  print(words2.length);

  final somme = [1, 3, 5].reduce((value, element) => value + element);
  print(somme);
}
