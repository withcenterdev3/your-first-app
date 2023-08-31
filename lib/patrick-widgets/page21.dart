import 'package:flutter/material.dart';

class InkWellDemoPage extends StatelessWidget {
  const InkWellDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'InkWell Demo';

    return MaterialApp(
        title: title,
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: const Center(
              child: MyButton(),
            ),
          );
        }));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: const Text('My Button'),
      ),
    );
  }
}
