import 'package:flutter/material.dart';

class HorizontalListPage extends StatelessWidget {
  const HorizontalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160,
              color: Colors.red,
            ),
            Container(width: 160, color: Colors.blue),
            Container(width: 160, color: Colors.green),
            Container(
              width: 160,
              color: Colors.yellow,
            ),
            Container(width: 160, color: Colors.orange)
          ],
        ),
      ),
    );
  }
}
