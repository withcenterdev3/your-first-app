import 'package:flutter/material.dart';

class ActivityPage3 extends StatelessWidget {
  const ActivityPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Horizontal View'),
        ),
        body: const MyHorizontal(),
      ),
    );
  }
}

class MyHorizontal extends StatelessWidget {
  const MyHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(
        // This next line does the trick.
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            color: Colors.red,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.green,
          ),
          Container(
            width: 160,
            color: Colors.yellow,
          ),
          Container(
            width: 160,
            color: Colors.orange,
          ),
          Container(
            width: 160,
            color: Colors.purple,
          ),
          Container(
            width: 160,
            color: Colors.pink,
          ),
          Container(
            width: 160,
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
