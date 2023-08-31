import 'package:flutter/material.dart';

class ActivityPage9 extends StatelessWidget {
  const ActivityPage9({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [Placeholder()],
      ),
    );
  }
}
