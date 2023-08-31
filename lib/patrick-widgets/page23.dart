import 'package:flutter/material.dart';

class SwipeToDismissDemoPage extends StatefulWidget {
  SwipeToDismissDemoPage({super.key});

  @override
  State<SwipeToDismissDemoPage> createState() => _SwipeToDismissPageState();
}

class _SwipeToDismissPageState extends State<SwipeToDismissDemoPage> {
  var items = List<String>.generate(20, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: ((context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: ((direction) {
                  setState(() {
                    items.removeAt(index);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$item dismissed'),
                    action: SnackBarAction(label: 'Undo', onPressed: (() {})),
                  ));
                }),
                child: ListTile(
                  title: Text(item),
                ),
              );
            })),
      ),
    );
  }
}
