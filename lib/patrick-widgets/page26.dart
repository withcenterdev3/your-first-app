import 'package:flutter/material.dart';

const title = 'Text Field Focus';

class TextFieldFocusPage extends StatelessWidget {
  const TextFieldFocusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: title, home: MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Enter a name'),
            autofocus: true,
          ),
          TextField(
            focusNode: myFocusNode,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myFocusNode.requestFocus();
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
