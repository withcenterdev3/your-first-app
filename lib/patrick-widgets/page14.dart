import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            textTheme: TextTheme(
                displayLarge:
                    TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                titleLarge:
                    TextStyle(fontSize: 36, fontStyle: FontStyle.normal))),
        child: MyInnerWidget());
  }
}

class MyInnerWidget extends StatelessWidget {
  const MyInnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title',
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Text with a backgrounnd color',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.yellow),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          )),
    );
  }
}
