import 'package:flutter/material.dart';

class MySeasonalThemePage extends StatelessWidget {
  const MySeasonalThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seasonal App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        //  Color.fromRGBO(182, 141, 60, 1)
      ),
      home: MySeasonalHome(title: 'Spring Season'),
    );
  }
}

class MySeasonalHome extends StatefulWidget {
  const MySeasonalHome({super.key, required this.title});

  final String title;

  @override
  State<MySeasonalHome> createState() => _MySeasonalHomeState();
}

class _MySeasonalHomeState extends State<MySeasonalHome> {
  int _count = 0;

  void _increament() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You have pressed this many times',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _count.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _increament();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
