void nullSafety() {
  String toto;

  //print(toto); // DOES NOT COMPILE

  String? titi;
  print(titi);

  toto = "hello";

  print("les variables sont $toto et $titi");

  titi = "goodbye";

  print("maintenant titi vaut $titi");

  titi = null;

  print(toto.length);
  //print(titi.length); // DOES NOT COMPILE
  print(titi?.length);
  print("Je préfère d ire 0 que null donc la taille de titi est ${titi?.length ?? 0}");

  titi = null;
   //print("Je suis sûr de moi pour titi, donc ${titi!.length}");

}
