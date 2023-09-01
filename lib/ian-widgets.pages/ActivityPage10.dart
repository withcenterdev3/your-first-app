import 'package:flutter/material.dart';

class ActivityPage10 extends StatelessWidget {
  const ActivityPage10({super.key});

  @override
  Widget build(BuildContext context) {
    VisualDensity density = Theme.of(context).visualDensity;
    return MaterialApp(
      theme: ThemeData(visualDensity: density),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Orientation Demo'),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          // Create a grid with 2 columns in portrait mode, or 3 columns in
          // landscape mode.
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            );
          }),
        );
      },
    );
  }
}
