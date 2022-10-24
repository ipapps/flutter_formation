import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String text;

  const Detail({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.add),
        //   onPressed: () {
        //     Navigator.pop(context, "Je reviens du détail");
        //   },
        // ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Page de détails : $text"),
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
                  Navigator.of(context).pushNamed("detail", arguments: "nouveau détail");
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
