import 'package:flutter/material.dart';

class FloatingAppPage extends StatelessWidget {
  const FloatingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[],
      ),
    );
  }
}
