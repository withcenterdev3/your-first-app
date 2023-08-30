import 'package:flutter/material.dart';

class FloatingAppPage extends StatelessWidget {
  const FloatingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'My App';

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: Text(title),
            floating: true,
            flexibleSpace: Placeholder(),
            expandedHeight: 200,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(title: Text('Item #$index')),
                  childCount: 1000))
        ],
      ),
    );
  }
}
