import 'package:flutter/material.dart';
import 'package:interakcija_s_korisnikom/notification.dart';

class SimpleNotificationScreen extends StatefulWidget {
  const SimpleNotificationScreen({super.key});

  @override
  State<SimpleNotificationScreen> createState() => _SimpleNotificationScreen();
}

class _SimpleNotificationScreen extends State<SimpleNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jednostavne notifikacije")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 18,
          children: [
            FilledButton(
              onPressed: () {
                notificationService.showNotification(
                  title: "Obavijest o zadatku",
                  body: "Imaš još 5 dana do predaje prve faze projekta, nemoj zaboraviti ne napraviti neki dio. Pati upute!!!",
                );
              },
              child: Text("Pošalji mi notifikaciju"),
            ),
          ],
        ),
      ),
    );
  }
}
