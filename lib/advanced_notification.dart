import 'package:flutter/material.dart';
import 'package:interakcija_s_korisnikom/notification.dart';

class AdvancedNotificationScreen extends StatefulWidget {
  const AdvancedNotificationScreen({super.key});

  @override
  State<AdvancedNotificationScreen> createState() =>
      _AdvancedNotifiactionScreen();
}

class _AdvancedNotifiactionScreen extends State<AdvancedNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Složene notifikacije")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 18,
          children: [
            FilledButton(
              onPressed: () {
                notificationService.showAdvancedNotifiction(
                  title: "Obavijest o tvojem dijelu projekta",
                  body: "Tvoji kolege su već napravili svoje dijelove projekta, a ti još nisi ni počeo. Bilo bi vrijeme da počneš!!!",
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
