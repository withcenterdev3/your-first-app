import 'package:flutter/material.dart';

class SpacedItemsPage extends StatelessWidget {
  const SpacedItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidget(text: 'Item 1'),
                ItemWidget(text: 'Item 2'),
                ItemWidget(text: 'Item 3')
              ],
            )),
      );
    }));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}
