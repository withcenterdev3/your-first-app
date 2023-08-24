import 'package:flutter/material.dart';

class PatrickPage extends StatelessWidget {
  const PatrickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Patrick'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Home',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: const Text('Start here'));
  }
}
