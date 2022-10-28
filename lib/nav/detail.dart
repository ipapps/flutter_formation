import 'package:flutter/material.dart';

class DetailArguments {
  final String myArgument;

  DetailArguments(this.myArgument);
}

class Detail extends StatelessWidget {
  static const routeName = "detail";

  final DetailArguments arguments;

  const Detail({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Page de détails : ${arguments.myArgument}"),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop("Je reviens du détail");
                },
                child: Text("Back"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("detail");
                },
                child: Text("Même page de détail"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("detail");
                },
                child: Text("Même page de détail sans ajouter à la stack"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("detail", arguments: DetailArguments("myArgument"));
                },
                child: Text("Même page de détail avec le texte \"nouveau détail\""),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.settings.name == "/");
                },
                child: Text("Revenir à la home quoi qu'il arrive"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("nulle part");
                },
                child: Text("Aller vers nulle part"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
