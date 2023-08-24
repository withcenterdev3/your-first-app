import 'package:flutter/material.dart';

class IanPage extends StatelessWidget {
  const IanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ian'),
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
