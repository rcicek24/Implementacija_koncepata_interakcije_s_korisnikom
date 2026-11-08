import 'package:flutter/material.dart';

import 'Toast.dart';

void main() {
  runApp(Aplikacija());
}

class Aplikacija extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interakcija s korisnikom",
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interakcija s korisnikom"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.chat_outlined),
          title: Text("Toast"),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Toast()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline_rounded),
          title: Text("SnackBar"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text("FAB kontrole"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.chat_bubble_outline),
          title: Text("Korisnički dijalozi"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text("Jednostavne notifikacije"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.notifications_active_outlined),
          title: Text("Složene notifikacije"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
