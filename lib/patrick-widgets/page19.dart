import 'package:flutter/material.dart';

class InteractiveViewLocationPage extends StatelessWidget {
  InteractiveViewLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = TitleSection();

    Color color = Theme.of(context).colorScheme.primary;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          GestureDetector(
              onTapDown: (details) {
                const snackBar = SnackBar(
                  content: Text('Share'),
                  showCloseIcon: true,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: _buildButtonColumn(color, Icons.share, 'SHARE'))
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities ',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Interactive Flutter App'),
        ),
        body: Builder(builder: (context) {
          return ListView(
            children: [
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          );
        }),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  color: color, fontSize: 14, fontWeight: FontWeight.w400),
            ))
      ],
    );
  }
}

class TitleSection extends StatefulWidget {
  TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschienen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              Text(
                'Kandersteg, Switzerland',
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Row(
            children: [
              GestureDetector(
                onTapDown: ((details) {
                  setState(() {
                    isLiked = !isLiked;
                  });
                }),
                child: Icon(
                  isLiked ? Icons.star : Icons.star_outline,
                  color: Colors.red,
                ),
              ),
              Text('41')
            ],
          )
        ],
      ),
    );
  }
}
