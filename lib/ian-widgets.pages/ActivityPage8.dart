import 'package:flutter/material.dart';

class ActivityPage8 extends StatelessWidget {
  const ActivityPage8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Place a floating app bar above a list'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return CustomScrollView(
      slivers: [
        // Add the app bar to the CustomScrollView.
        const SliverAppBar(
          // Provide a standard title.
          title: Text(title),
          // Allows the user to reveal the app bar if they begin scrolling
          // back up the list of items.
          floating: true,
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: Placeholder(),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 200,
        ),
        // Next, create a SliverList
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, index) => ListTile(title: Text('Item #$index')),
            // Builds 1000 ListTiles
            childCount: 1000,
          ),
        ),
      ],
    );
  }
}
