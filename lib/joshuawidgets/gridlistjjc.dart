import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return MaterialApp(
      title: title,
      home: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          100,
          (i) {
            return Center(
              child: Text(
                'Item $i',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          },
        ),
      ),
    );
  }
}
