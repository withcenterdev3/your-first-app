import 'package:flutter/material.dart';

class GestureDemoPage extends StatelessWidget {
  const GestureDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Gesture Demo';

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
    return GestureDetector(
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(8)),
        child: const Text('My Button'),
      ),
    );
  }
}
