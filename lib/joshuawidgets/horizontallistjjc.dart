import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: Container(
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: 160,
                ),
                Container(
                  color: Colors.blue,
                  width: 160,
                ),
                Container(
                  color: Colors.green,
                  width: 160,
                ),
                Container(
                  color: Colors.yellow,
                  width: 160,
                ),
                Container(
                  color: Colors.orange,
                  width: 160,
                ),
              ],
            ),
          )),
    );
  }
}
