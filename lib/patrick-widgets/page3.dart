import 'package:flutter/material.dart';

class BuildALayoutPage extends StatelessWidget {
  const BuildALayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text('Oeschienen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Color.fromRGBO(10, 10, 10, 100),
                    )),
              ],
            )),
            Icon(
              Icons.star,
              color: Color.fromRGBO(255, 0, 0, 100),
            ),
            const Text('41')
          ],
        ));

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE')
      ],
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: const Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities ',
          softWrap: true,
        ));

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Column(children: [titleSection, buttonSection, textSection]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}
