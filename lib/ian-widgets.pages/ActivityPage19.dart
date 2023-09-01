import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class ActivityPage19 extends StatelessWidget {
//   const ActivityPage19({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         home: Scaffold(
//       body: MyHomePage(),
//     ));
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Image.network('https://picsum.photos/250?image=9');
//   }
// }
// import 'package:flutter/material.dart';

void main() => runApp(const ActivityPage19());

class ActivityPage19 extends StatelessWidget {
  const ActivityPage19({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('display image from web'),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network('https://picsum.photos/250?image=9'),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('display fade image '),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInImage.assetNetwork(
              placeholder: 'images/loading.gif',
              image: 'https://picsum.photos/250?image=8',
            ),
          ],
        ),
      ),
    );
  }
}
