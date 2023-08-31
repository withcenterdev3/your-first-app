import 'package:flutter/material.dart';

class TextFieldDemoPage extends StatelessWidget {
  const TextFieldDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Text field demo';
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(title: Text('text')),
          body: ListView(
            padding: EdgeInsets.all(10),
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email'),
              )
            ],
          ),
          floatingActionButton:
              FloatingActionButton(onPressed: (() {}), child: Icon(Icons.add))),
    );
  }
}
