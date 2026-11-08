import 'package:flutter/material.dart';

class SnackBarScreen extends StatefulWidget {
  const SnackBarScreen({super.key});

  @override
  State<SnackBarScreen> createState() => _SnackBarScreen();
}

class _SnackBarScreen extends State<SnackBarScreen> {
  final TextEditingController biljeska = TextEditingController();
  String? greska;

  @override
  void dispose() {
    biljeska.dispose();
    super.dispose();
  }

  void spremibiljesku() {
    String tekst = biljeska.text.trim();

    if (tekst.isEmpty) {
      setState(() {
        greska = "Bilješka ne smije biti prazna!!";
      });
      return;
    }

    setState(() {
      greska = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bilješka je uspješno spremljena"),
        action: SnackBarAction(
          label: "Prikaži",
          onPressed: () {
            if (!mounted) return;

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Spremljena bilješka"),
                content: Text(tekst),
              ),
            );
          },
        ),
      ),
    );
  }

  void actionSnack() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Unesi bilješku kako bi je mogao spremiti"),
        duration: Duration(seconds: 10),
      ),
    );
  }

  void zamijeniSnack() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text("Prethodna poruka zamijenjena")),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snackbar poruke")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 18,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: biljeska,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Bilješka",
                  hintText: "Upišite svoju bilješku",
                  border: const OutlineInputBorder(),
                  errorText: greska,
                ),
              ),
            ),
            FilledButton(
              onPressed: spremibiljesku,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Spremi bilješku"),
            ),
            FilledButton(
              onPressed: actionSnack,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Informacija"),
            ),
            FilledButton(
              onPressed: zamijeniSnack,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Zamijeni snackbar"),
            ),
          ],
        ),
      ),
    );
  }
}
