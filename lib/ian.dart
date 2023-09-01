import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage1.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage10.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage11.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage12.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage13.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage14.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage15.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage16.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage17.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage18.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage19.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage2.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage20.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage21.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage22.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage23.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage24.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage25.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage3.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage4.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage5.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage6.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage7.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage8.dart';
import 'package:your_first_app/ian-widgets.pages/ActivityPage9.dart';
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
        page = const ActivityPage1();
        break;
      case 3:
        page = const ActivityPage2();
        break;
      case 4:
        page = const ActivityPage3();
        break;
      case 5:
        page = const ActivityPage4();
        break;
      case 6:
        page = const ActivityPage5();
        break;
      case 7:
        page = const ActivityPage6();
        break;
      case 8:
        page = const ActivityPage7();
        break;
      case 9:
        page = const ActivityPage8();
        break;
      case 10:
        page = const ActivityPage9();
        break;
      case 11:
        page = const ActivityPage10();
        break;
      case 12:
        page = const ActivityPage11();
        break;
      case 13:
        page = const ActivityPage12();
        break;
      case 14:
        page = const ActivityPage13();
        break;
      case 15:
        page = const ActivityPage14();
        break;
      case 16:
        page = const ActivityPage15();
        break;
      case 17:
        page = const ActivityPage16();
        break;
      case 18:
        page = const ActivityPage17();
        break;
      case 19:
        page = const ActivityPage18();
        break;
      case 20:
        page = const ActivityPage19();
        break;
      case 21:
        page = const ActivityPage20();
        break;
      case 22:
        page = const ActivityPage21();
        break;
      case 23:
        page = const ActivityPage22();
        break;
      case 24:
        page = const ActivityPage23();
        break;
      case 25:
        page = const ActivityPage24();
        break;
      case 26:
        page = const ActivityPage25();
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

              // SafeArea(
              //     child: BottomNavigationBar(
              //   items: const [
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.home), label: 'home'),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.favorite), label: 'Favorites'),
              //     BottomNavigationBarItem(
              //         icon: Icon(Icons.person), label: 'activity 1')
              //   ],
              //   currentIndex: selectedIndex,
              //   onTap: (value) {
              //     setState(() {
              //       selectedIndex = value;
              //     });
              //   },
              // ))
            ],
          );
        }
        // else the sidebar for big screen
        else {
          return Row(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height),
                    child: IntrinsicHeight(
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
                            icon: Icon(Icons.checklist),
                            label: Text('build a layout'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('list view'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('list horizontal view'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('grid view '),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('list types of items'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('list with spaced items'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('long list '),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('floating app above list'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('paralax effect'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('orientation'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('custom themes'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('custom fonts'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Handle taps'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('active inactive'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Drag a UI element'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Dismissing Items'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('SnackBar Demo'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('actions & shortcuts'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Web Images'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Butterfly Video'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('Tabs Demo'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('activity'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('activity'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('activity'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.checklist),
                            label: Text('activity'),
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
                  ),
                ),
              ),

              // SafeArea(
              //   child: NavigationRail(
              //     extended: constraints.maxWidth >= 600,
              //     destinations: const [
              //       NavigationRailDestination(
              //         icon: Icon(Icons.home),
              //         label: Text('Home'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.favorite),
              //         label: Text('Favorites'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 1'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 2'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 3'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 4'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 5'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 6'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 7'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 8'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 9'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 10'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 11'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 12'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 13'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 14'),
              //       ),
              //       NavigationRailDestination(
              //         icon: Icon(Icons.checklist),
              //         label: Text('activity 15'),
              //       ),
              //     ],
              //     selectedIndex: selectedIndex,
              //     onDestinationSelected: (value) {
              //       setState(() {
              //         selectedIndex = value;
              //       });
              //     },
              //   ),
              // ),
              Expanded(child: mainArea),
            ],
          );
        } //end of else
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
