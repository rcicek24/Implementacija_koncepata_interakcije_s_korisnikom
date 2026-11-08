import 'package:flutter/material.dart';

class UserDialogScreen extends StatefulWidget {
  const UserDialogScreen({super.key});

  @override
  State<UserDialogScreen> createState() => _UserDialogScreen();
}

class _UserDialogScreen extends State<UserDialogScreen> {
  void infoDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Informacije"),
        content: const Text(
          "Informativni dijalog koji pokazuje korisniku neke informacije",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text("U redu"),
          ),
        ],
      ),
    );
  }

  bool zadDovrsen = false;

  void potvrdiDijalog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Status zadatka"),
        content: const Text("Odaberite status vašeg zadatka"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text("Otkaži"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                zadDovrsen = false;
              });
              Navigator.pop(dialogContext);
            },
            child: const Text("Nije dovršen"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                zadDovrsen = true;
              });
              Navigator.pop(dialogContext);
            },
            child: const Text("Dovršen"),
          ),
        ],
      ),
    );
  }

  bool zadatak = true;

  void brisanjeDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Brisanje zadatka"),
        content: const Text(
          "Jeste li sigurni da želite obrisati ovaj zadatak?",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: const Text("Odustani"),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () {
              setState(() {
                zadatak = false;
              });
              Navigator.pop(dialogContext);
            },
            child: Text("Obriši"),
          ),
        ],
      ),
    );
  }

  String prioritet = "Nije odabran";

  Future<void> _odaberi() async {
    final odabrani = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Odaberite razinu prioriteta"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Visok");
              },
              child: const Text("Visoki prioritet"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Srednji");
              },
              child: const Text("Srednji prioritet"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, "Nizak");
              },
              child: const Text("Niski prioritet"),
            ),
          ],
        );
      },
    );

    if (!mounted) return;

    if (odabrani != null) {
      setState(() {
        prioritet = odabrani;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Korisnički dijalozi")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 25,
          children: [
            FilledButton(
              onPressed: infoDialog,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Informativni dijalog"),
            ),
            if (zadatak)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task_alt),
                  SizedBox(width: 10),
                  Text("Predaja prve faze projekta"),
                ],
              ),
            if (zadatak)
              FilledButton(
                style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
                onPressed: brisanjeDialog,
                child: const Text("Obriši zadatak"),
              ),
            if (!zadatak)
              FilledButton(
                onPressed: () {
                  setState(() {
                    zadatak = true;
                    zadDovrsen = true;
                    prioritet = "Nije odabran";
                  });
                },
                style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
                child: const Text("Vrati zadatak"),
              ),
            if (zadatak)
              FilledButton(
                onPressed: potvrdiDijalog,
                style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
                child: const Text("Promijeni status zadatka"),
              ),
            if (zadatak)
              Text(zadDovrsen ? "Zadatak je dovršen" : "Zadatak nije dovršen"),
            if (zadatak)
              FilledButton(
                onPressed: _odaberi,
                style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
                child: const Text("Odabir prioriteta"),
              ),
            if (zadatak) Text("Odabrani prioritet: $prioritet"),
          ],
        ),
      ),
    );
  }
}
