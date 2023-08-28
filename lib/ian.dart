import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';

class IanPage extends StatefulWidget {
  const IanPage({super.key});

  @override
  State<IanPage> createState() => _IanPageState();
}

class _IanPageState extends State<IanPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'ian page',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var mylist = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    if (mylist.contains(current)) {
      mylist.remove(current);
    } else {
      mylist.add(current);
      print(mylist);
    }
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple[100],
          backgroundColor: Colors.purple[900],
          title: const Text(
            'Ian',
            style: TextStyle(color: (Colors.white)),
          ),

          leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back',
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            IconButton(
                color: Colors.white,
                icon: const Icon(Icons.home),
                tooltip: 'Home',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.location_history),
                    label: Text('sample 2'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page, // ← Here.
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    // Expanded(

    //     child: ListView(

    //   children: [
    //     for (var pair in appState.mylist)
    //       ListTile(
    //         // leading: Icon(Icons.favorite),
    //         title: Text(pair.asLowerCase),
    //       ),
    //   ],
    // )),
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: new ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  Center(
                      child: ListTile(
                    title: Text(pair.asLowerCase),
                  )),
                ]),
          ),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
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
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text(
            pair.asLowerCase,
            style: style,
            semanticsLabel: '${pair.first}${pair.second}',
          )),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Back',
                onPressed: () {
                  appState.favorites.remove(pair);
                }),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}


// Scaffold(
//         appBar: AppBar(
//           // backgroundColor: Colors.purple[100],
//           title: const Text('Ian'),
//           actions: <Widget>[
//             IconButton(
//                 icon: const Icon(Icons.home),
//                 tooltip: 'Home',
//                 onPressed: () {
//                   Navigator.pop(context);
//                 }),
//           ],
//         ),
//         bottomNavigationBar: MediaQuery.of(context).size.width < 540
//             ? BottomNavigationBar(
//                 items: const [
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.home), label: "home"),
//                   BottomNavigationBarItem(
//                       icon: Icon(Icons.favorite), label: "favorite")
//                 ],
//                 currentIndex: _currentItem,
//                 onTap: (value) {
//                   setState(() {
//                     _currentItem = value;
//                   });
//                 },
//               )
//             : null,
//         body: Row(
//           children: [
//             if (MediaQuery.of(context).size.width >= 540)
//               NavigationRail(
//                 backgroundColor: Colors.purple[400],
//                 destinations: const [
//                   NavigationRailDestination(
//                       icon: Icon(Icons.home), label: Text("home")),
//                   NavigationRailDestination(
//                       icon: Icon(Icons.favorite), label: Text("favorite")),
//                 ],
//                 selectedIndex: _currentItem,
//                 onDestinationSelected: (int index) {
//                   setState(() {
//                     _currentItem = index;
//                     // Handle navigation or other changes based on selectedIndex
//                   });
//                 },
//               ),
//             tabs[_currentItem],
//           ],
//         ));

