import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsPage extends StatelessWidget {
  const GoogleFontsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(useMaterial3: true),
        home: MyHomePage(title: 'Google fonts demo'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Future googleFontsPending;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.poppins(),
      GoogleFonts.montserrat(fontStyle: FontStyle.italic),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.fahkwang(),
        ),
      ),
      body: Center(
          child: FutureBuilder(
              future: googleFontsPending,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const SizedBox();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times',
                      style: TextStyle(),
                    ),
                    Text(
                      '$_counter',
                      style: TextStyle(),
                    )
                  ],
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
