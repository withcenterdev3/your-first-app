import 'package:flutter/material.dart';

class LongListPage extends StatelessWidget {
  final List<String> items;
  const LongListPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: ((context, index) {
      return ListTile(
        title: Text(items[index]),
      );
    }));
  }
}
