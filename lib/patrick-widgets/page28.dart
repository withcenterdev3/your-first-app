import 'package:flutter/material.dart';

const title = 'SnackBar Demo';

class SnackBarDemoPage extends StatelessWidget {
  const SnackBarDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: SnackBarPage(),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Yay! A SnackBar'),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: (() {
                        // Do some undo action
                      })),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Show Snackbar'))
        ],
      )),
    );
  }
}
