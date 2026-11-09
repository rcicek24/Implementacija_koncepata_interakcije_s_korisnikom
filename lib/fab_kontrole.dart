import 'package:flutter/material.dart';

class FABControlScreen extends StatefulWidget {
  const FABControlScreen({super.key});

  @override
  State<FABControlScreen> createState() => _FABControlScreen();
}

class _FABControlScreen extends State<FABControlScreen> {
  List<String> issues = [];

  void dodajIssue() {
    setState(() {
      issues.add("Issue ${issues.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FAB kontrole")),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "RAMPU issues",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: issues.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.album),
                  title: Text(issues[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Dodaj zadatak",
        onPressed: dodajIssue,
        child: Icon(Icons.add),
      ),
    );
  }
}
