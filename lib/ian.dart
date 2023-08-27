import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class IanPage extends StatefulWidget {
  const IanPage({super.key});

  @override
  State<IanPage> createState() => _IanPageState();
}

class _IanPageState extends State<IanPage> {
  int _currentItem = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Expanded(
          child: Center(
        child: MyHomePage(),
      )),
      const Expanded(
          child: Center(
        child: Myfavorites(),
      )),
    ];

    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple[100],
          title: const Text('Ian'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Home',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width < 540
            ? BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: "favorite")
                ],
                currentIndex: _currentItem,
                onTap: (value) {
                  setState(() {
                    _currentItem = value;
                  });
                },
              )
            : null,
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 540)
              NavigationRail(
                backgroundColor: Colors.purple[400],
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text("favorite")),
                ],
                selectedIndex: _currentItem,
                onDestinationSelected: (int index) {
                  setState(() {
                    _currentItem = index;
                    // Handle navigation or other changes based on selectedIndex
                  });
                },
              ),
            tabs[_currentItem],
          ],
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WordPair current;
  List<String> stringArray = [];
  @override
  void initState() {
    super.initState();
    current = WordPair.random(); // Initialize the random word pair
  }

  void generateRandomWordPair() {
    setState(() {
      current = WordPair.random(); // Generate and update the word pair
    });
  }

  void _addItem(String newItem) {
    if (newItem.isNotEmpty) {
      setState(() {
        stringArray.add(newItem);
        print(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // ↓ Add this.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.primary,
    );

    return Container(
      // width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              // width: MediaQuery.of(context).size.width,
              height: 200,
              width: 200,
              color: Colors.grey[300],
              child: Expanded(
                  child: ListView.builder(
                itemCount: stringArray.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(stringArray[index]),
                    ),
                  );
                },
              )),
            ),
          ),
          // Text("data"),

          const SizedBox(
            height: 24,
          ),
          const Text('A random AWESOME ideas:'),
          const SizedBox(
            height: 24,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(current.asLowerCase, style: style),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  _addItem(current.asPascalCase);
                  generateRandomWordPair();
                },
                child: const Text('next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Myfavorites extends StatefulWidget {
  const Myfavorites({super.key});

  @override
  State<Myfavorites> createState() => _MyfavoritesState();
}

class _MyfavoritesState extends State<Myfavorites> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue[100],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('my favorites page')],
      ),
    );
  }
}
