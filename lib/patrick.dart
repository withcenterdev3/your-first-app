import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_first_app/patrick-widgets/page10.dart';
import 'package:your_first_app/patrick-widgets/page11.dart';
import 'package:your_first_app/patrick-widgets/page12.dart';
import 'package:your_first_app/patrick-widgets/page13.dart';
import 'package:your_first_app/patrick-widgets/page14.dart';
import 'package:your_first_app/patrick-widgets/page15.dart';
import 'package:your_first_app/patrick-widgets/page16.dart';
import 'package:your_first_app/patrick-widgets/page3.dart';
import 'package:your_first_app/patrick-widgets/page4.dart';
import 'package:your_first_app/patrick-widgets/page5.dart';
import 'package:your_first_app/patrick-widgets/page6.dart';
import 'package:your_first_app/patrick-widgets/page7.dart';
import 'package:your_first_app/patrick-widgets/page8.dart';
import 'package:your_first_app/patrick-widgets/page9.dart';

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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            // textTheme: TextTheme(
            //     displayLarge:
            //         TextStyle(fontSize: 72, fontWeight: FontWeight.bold))
          ),
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

class PatrickContainer extends StatefulWidget {
  @override
  State<PatrickContainer> createState() => _PatrickContainerState();
}

class _PatrickContainerState extends State<PatrickContainer> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = BuildALayoutPage();
        break;
      case 3:
        page = CreateAListViewPage();
        break;
      case 4:
        page = HorizontalListPage();
        break;
      case 5:
        page = GridListPage();
        break;
      case 6:
        page = LWDiffTypesPage(
          items: List<ListItem>.generate(
              1000,
              (index) => index % 6 == 0
                  ? HeadingItem('Heading $index')
                  : MessageItem('Sender $index', 'Message $index')),
        );
        break;
      case 7:
        page = SpacedItemsPage();
        break;
      case 8:
        page = SpacedItemsPage2();
        break;
      case 9:
        page = LongListPage(
            items: List<String>.generate(10000, (index) => 'Item $index'));
        break;
      case 10:
        page = HorizonsPage();
        break;
      case 11:
        page = FloatingAppPage();
        break;
      case 12:
        page = ParallaxPage();
        break;
      case 13:
        page = ThemePage();
        break;
      case 14:
        page = MySeasonalThemePage();
        break;
      case 15:
        page = LayoutGridPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
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
          body: Row(children: [
            SafeArea(
                child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                          icon: Icon(Icons.home), label: Text('Home')),
                      NavigationRailDestination(
                          icon: Icon(Icons.favorite), label: Text('Favorites')),
                      NavigationRailDestination(
                          icon: Icon(Icons.build),
                          label: Text('Build A Layout')),
                      NavigationRailDestination(
                          icon: Icon(Icons.list),
                          label: Text('Create A List View')),
                      NavigationRailDestination(
                          icon: Icon(Icons.horizontal_distribute),
                          label: Text('Horizontal List')),
                      NavigationRailDestination(
                          icon: Icon(Icons.grid_3x3), label: Text('Grid List')),
                      NavigationRailDestination(
                          icon: Icon(Icons.view_list_outlined),
                          label: Text('List with different types of Items')),
                      NavigationRailDestination(
                          icon: Icon(Icons.space_bar),
                          label: Text('Spaced Items')),
                      NavigationRailDestination(
                          icon: Icon(Icons.space_bar),
                          label: Text('Spaced Items 2')),
                      NavigationRailDestination(
                          icon: Icon(Icons.list_outlined),
                          label: Text('Long List')),
                      NavigationRailDestination(
                          icon: Icon(Icons.list_outlined),
                          label: Text('Slivers')),
                      NavigationRailDestination(
                          icon: Icon(Icons.flag_circle_outlined),
                          label: Text('Floating app')),
                      NavigationRailDestination(
                          icon: Icon(Icons.access_alarms_sharp),
                          label: Text('Parallax')),
                      NavigationRailDestination(
                          icon: Icon(Icons.light_mode), label: Text('Theme')),
                      NavigationRailDestination(
                          icon: Icon(Icons.sunny),
                          label: Text('Seasonal Themeing')),
                      NavigationRailDestination(
                          icon: Icon(Icons.ac_unit_sharp),
                          label: Text('Layout Grid'))
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
            )),
            Expanded(
                child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page))
          ]));
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PatrickPageState>();
    var pair = appState.current;
    var favorites = appState.favorites;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('A random AWESOME idea'),
          BigCard(
            pair: pair,
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(favorites.contains(pair)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined),
                  label: Text('Like')),
              SizedBox(
                width: 10.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next')),
            ],
          )
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PatrickPageState>();
    var favorites = appState.favorites;

    return ListView(
      children: [
        Text('Favorites'),
        for (var fav in favorites) FavoriteChip(fav: fav),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class FavoriteChip extends StatelessWidget {
  const FavoriteChip({
    super.key,
    required this.fav,
  });

  final WordPair fav;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(Icons.favorite),
      label: Text(fav.asLowerCase),
      // child: ListTile(
      //   leading: Icon(Icons.favorite),
      //   title:Text(fav.asLowerCase)),
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
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.surface);

    return Card(
      color: theme.colorScheme.primary,
      elevation: 10.00,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
