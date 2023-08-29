import 'package:flutter/material.dart';

class LWDiffTypesPage extends StatelessWidget {
  const LWDiffTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}
