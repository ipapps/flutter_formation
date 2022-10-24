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