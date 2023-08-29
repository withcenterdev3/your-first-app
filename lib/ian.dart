import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:your_first_app/main.dart';
import 'package:flutter/cupertino.dart';

class IanPage extends StatefulWidget {
  const IanPage({super.key});

  @override
  State<IanPage> createState() => _IanPageState();
}

class _IanPageState extends State<IanPage> {
  @override
  Widget build(BuildContext context) {
    /*
    ChangeNotifierProvider a class provided by the provider package in Flutter. 
    It's a part of the "Provider" pattern, which is a state management solution 
    that helps manage and share state across different parts of  Flutter app. 
    */
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ian page',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

/*
 extends ChangeNotifier. This class is used to store the state 
 that you want to share across the app.
 */
class MyAppState extends ChangeNotifier {
  /*
  WordPair from english_words  package thenthe random method 
  to generate random words
   */
  var current = WordPair.random();
  var history = <WordPair>[];

  /*
   GlobalKey is a  class that provides a way to uniquely
   identify widgets across different parts of  widget tree.
   The ? indicates that the variable can be null
   */
  GlobalKey? historyListKey;

  void getNext() {
    /*
   inserting the current word pair at the beginning of the history list. then
   accessing the currentState of the AnimatedList associated with the historyListKey.
   insertItem method on the AnimatedListState to insert an item into the AnimatedList.
   The ? is used again for null safety.
  */
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);

    current = WordPair.random(); //generate random word pair
    notifyListeners();
    /*
   notifyListeners() is a method provided by the ChangeNotifier class, 
   which is a part of the "Provider" pattern for state management.  
  */
  }

  var favorites = <WordPair>[];
  /* 
  pair = pair ?? current; uses the null-aware operator ?? to provide a
  default value for pair. If pair is null, it will be assigned the value of current. 
  */
  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;

    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    favorites.remove(pair);
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
    var colorScheme = Theme.of(context).colorScheme;
    /* 
  sets the page variable to a specific widget based on the selectedIndex. 
  The page widget is then used in the widget tree to determine 
  which content to display in the main area of the app.
  */
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const SecondActivtyPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    /*
    the mainArea widget is a combination of a ColoredBox with a background color
    and an AnimatedSwitcher that animates transitions between different child widgets.
    The page widget is being animated when it's replaced by another widget, 
    creating a smooth and visually appealing transition effect.
    */
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: CupertinoButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const MyApp()),
              );
            }),
        title: const Text('Ian'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Home',
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const MyApp()),
                );
              }),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        // if max width reached 450 pixels then bottom navigation
        if (constraints.maxWidth < 450) {
          return Column(
            children: [
              Expanded(child: mainArea),
              SafeArea(
                  child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorites'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'activity 2')
                ],
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ))
            ],
          );
        }
        // else the sidebar for big screen
        else {
          return Row(
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
                      icon: Icon(Icons.person),
                      label: Text('activity 2'),
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
              Expanded(child: mainArea),
            ],
          );
        }
      }),
    );
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: HistoryListView()),
          const SizedBox(height: 10),
          BigCard(pair: pair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: const Text('Next'),
              ),
            ],
          ),
          const Spacer(flex: 2)
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
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.all(40),
          child: AnimatedSize(
            duration: const Duration(microseconds: 200),
            child: Wrap(
              children: [
                Text(
                  pair.first,
                  style: style.copyWith(fontWeight: FontWeight.w100),
                ),
                Text(
                  pair.second,
                  style: style.copyWith(fontWeight: FontWeight.w800),
                )
              ],
            ),
          )),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(30),
            child:
                Text('you have ' '${appState.favorites..length} favorites:')),
        Expanded(
            child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 400 / 80,
          ),
          children: [
            for (var pair in appState.favorites)
              ListTile(
                title: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
                leading: IconButton(
                  onPressed: () {
                    appState.removeFavorite(pair);
                  },
                  icon: const Icon(Icons.delete),
                  color: theme.colorScheme.primary,
                ),
              )
          ],
        ))
      ],
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({super.key});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  final _key = GlobalKey();

  static const Gradient _maskingGradient = LinearGradient(
      colors: [Colors.transparent, Colors.black],
      stops: [0.0, 0.5],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    appState.historyListKey = _key;

    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
          key: _key,
          reverse: true,
          padding: const EdgeInsets.only(top: 100),
          initialItemCount: appState.history.length,
          itemBuilder: (context, index, animation) {
            final pair = appState.history[index];
            return SizeTransition(
              sizeFactor: animation,
              child: Center(
                child: TextButton.icon(
                    onPressed: () {
                      appState.toggleFavorite(pair);
                    },
                    icon: appState.favorites.contains(pair)
                        ? const Icon(Icons.favorite, size: 12)
                        : const SizedBox(),
                    label: Text(
                      pair.asLowerCase,
                      semanticsLabel: pair.asPascalCase,
                    )),
              ),
            );
          }),
    );
  }
}

class SecondActivtyPage extends StatelessWidget {
  const SecondActivtyPage({super.key});

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
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    return ListView(
      children: [
        Image.asset(
          'images/lake.jpg',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection
      ],
    );
  }
}
