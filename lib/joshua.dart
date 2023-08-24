import 'package:flutter/material.dart';

class JoshuaPage extends StatelessWidget {
  const JoshuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Joshua'),
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
