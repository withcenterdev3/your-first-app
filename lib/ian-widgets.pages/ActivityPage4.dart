import 'package:flutter/material.dart';

class ActivityPage4 extends StatefulWidget {
  const ActivityPage4({super.key});

  @override
  State<ActivityPage4> createState() => _ActivityPage4State();
}

class _ActivityPage4State extends State<ActivityPage4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grid View'),
        ),
        body: MyGrid(),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
      }),
    );
  }
}
