import 'package:flutter/material.dart';

class TextFieldChangeHandlingPage extends StatefulWidget {
  const TextFieldChangeHandlingPage({super.key});

  @override
  State<TextFieldChangeHandlingPage> createState() =>
      _TextFieldChangeHandlingPage();
}

class _TextFieldChangeHandlingPage extends State<TextFieldChangeHandlingPage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    final text = myController.text;
    print('Second text field: $text (${text.characters})');
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Handling Text Field Input';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  print('First text field: $text');
                },
              ),
              TextField(
                controller: myController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
