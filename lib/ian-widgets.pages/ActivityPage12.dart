import 'package:flutter/material.dart';

class ActivityPage12 extends StatelessWidget {
  const ActivityPage12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Custom Fonts'),
            ),
            body: const MyHomePage()));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Roboto Mono sample',
        style: TextStyle(fontFamily: 'RobotoMono', fontSize: 50),
      ),
    );
  }
}
//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