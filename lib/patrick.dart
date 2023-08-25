import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatrickPage extends StatelessWidget {
  const PatrickPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PatrickPageState(),
        child: MaterialApp(
          title: 'Namer App',
          theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
          home: PatrickContainer(),
        ));
  }
}

class PatrickPageState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class PatrickContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PatrickPageState>();
    var pair = appState.current;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Patrick'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Home',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('A random AWESOME idea'),
           BigCard(pair: pair,),
           // Add this
           ElevatedButton(onPressed: () {appState.getNext();},
            child: Text('Next'))],
           
        ));
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.surface
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 10.00,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",),
      ),
    );
  }
}
