import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastScreen extends StatefulWidget {
  const ToastScreen({super.key});

  @override
  State<ToastScreen> createState() => _ToastScreenState();
}

class _ToastScreenState extends State<ToastScreen> {
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  void kratkiToast() =>
      Fluttertoast.showToast(msg: "Toast🍞", toastLength: Toast.LENGTH_SHORT);

  void dugiToast() => Fluttertoast.showToast(
    msg: "Neki malo duzi Toast🍞🍞🍞",
    toastLength: Toast.LENGTH_LONG,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toast poruke")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 18,
          children: [
            FilledButton(
              onPressed: kratkiToast,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Kratki toast"),
            ),
            FilledButton(
              onPressed: dugiToast,
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Dugi toast"),
            ),
            FilledButton(
              onPressed: () {
                toast.showToast(
                  child: buildToast(),
                  gravity: ToastGravity.CENTER,
                  toastDuration: Duration(seconds: 4),
                );
              },
              style: FilledButton.styleFrom(minimumSize: Size(180, 55)),
              child: const Text("Custom toast"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToast() => Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.green,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check, color: Colors.black),
        SizedBox(width: 12),
        Text(
          "Ovo je naš custom toast",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    ),
  );
}
