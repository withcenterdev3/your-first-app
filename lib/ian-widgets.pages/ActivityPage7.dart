import 'package:flutter/material.dart';

class ActivityPage7 extends StatelessWidget {
  const ActivityPage7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Work with long lists'),
        ),
        body: MyHomePage(
          items: List<String>.generate(10000, (i) => 'Item $i'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> items;

  const MyHomePage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      prototypeItem: ListTile(
        title: Text(items.first),
      ),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
