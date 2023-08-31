import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class LayoutGridPage extends StatelessWidget {
  const LayoutGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: LayoutGrid(
          areas: '''
              header header header
              nav    content aside
              nav content .
              footer footer footer
            ''',
          columnSizes: [75.px, 1.fr, 100.px],
          rowSizes: [112.px, auto, 1.fr, 64.px],
          children: [
            NamedAreaGridPlacement(
                areaName: 'header',
                child: Container(
                  color: Colors.blue,
                  child: Center(child: Text('Header')),
                )),
            NamedAreaGridPlacement(
                areaName: 'nav',
                child: Container(
                  color: Colors.grey,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Center(
                      child: Text(
                        'Navbar',
                      ),
                    ),
                  ),
                )),
            gridArea('content').containing(Container(
              color: Colors.orange,
              child: Center(
                child: Text('Contents'),
              ),
            )),
            gridArea('aside').containing(Container(
              color: Colors.cyan,
              child: Center(
                child: Text('Aside'),
              ),
            ))
          ],
        ));
  }
}
