import 'package:flutter/material.dart';
import 'package:your_first_app/patrick-widgets/page8.dart';

class SpacedItemsPage2 extends StatelessWidget {
  const SpacedItemsPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemWidget(text: 'Item 1'),
                    Spacer(),
                    ItemWidget(
                      text: 'Item 2',
                    ),
                    Expanded(
                        child: ItemWidget(
                      text: 'Item 3',
                    ))
                  ]),
            )),
      );
    }));
  }
}
