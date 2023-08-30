// import 'dart:html';

import 'package:flutter/material.dart';

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = TextStyle(fontSize: 30);

class LayoutContraintsPage extends StatelessWidget {
  const LayoutContraintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlutterLayoutArticle(examples: [
      Example1(),
      Example2(),
      Example3(),
      Example4(),
      Example5(),
      Example6(),
      Example7(),
      Example8(),
      Example9(),
      Example10(),
      Example11(),
      Example12(),
      Example13(),
      Example14(),
      Example15(),
      Example16(),
      Example17(),
      Example18()
    ]);
  }
}

abstract class Example extends StatelessWidget {
  const Example({super.key});

  String get code;

  String get explanation;
}

class FlutterLayoutArticle extends StatefulWidget {
  const FlutterLayoutArticle({super.key, required this.examples});

  final List<Example> examples;

  @override
  State<FlutterLayoutArticle> createState() => _FlutterLayoutArticleState();
}

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    count = 1;
    code = const Example1().code;
    explanation = const Example1().explanation;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layout and Constraints',
      home: SafeArea(
          child: Material(
        color: Colors.black,
        child: FittedBox(
          child: Container(
            width: 400,
            height: 670,
            color: const Color(0xFFCCCCCC),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(
                      width: double.infinity, height: double.infinity),
                  child: widget.examples[count - 1],
                )),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      for (int i = 0; i < widget.examples.length; i++)
                        Container(
                          width: 58,
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: button(i + 1),
                        )
                    ]),
                  ),
                ),
                Container(
                  height: 273,
                  color: Colors.grey[50],
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      key: ValueKey(count),
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        Center(
                          child: Text(code),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          explanation,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontStyle: FontStyle.italic),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget button(int exampleNumber) {
    return Button(
      key: ValueKey('button$exampleNumber'),
      isSelected: count == exampleNumber,
      exampleNumber: exampleNumber,
      onPressed: () {
        showExample(exampleNumber, widget.examples[exampleNumber - 1].code,
            widget.examples[exampleNumber - 1].explanation);
      },
    );
  }

  void showExample(int exampleNumber, String code, String explanation) {
    setState(() {
      count = exampleNumber;
      this.code = code;
      this.explanation = explanation;
    });
  }
}

class Button extends StatelessWidget {
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  const Button(
      {super.key,
      required this.isSelected,
      required this.exampleNumber,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: isSelected ? Colors.grey : Colors.grey[800]),
        onPressed: onPressed,
        child: Text(exampleNumber.toString()));
  }
}

////////////////////////////
class Example1 extends Example {
  const Example1({super.key});

  @override
  final code = 'Container(color: red)';

  @override
  final explanation = 'The screen is the parent of the Container,'
      'and it forces the Container to be exactly the same size as the screen'
      '\n\n'
      'So the Container fills the screen and paints it red';

  @override
  Widget build(BuildContext context) {
    return Container(color: red);
  }
}

class Example2 extends Example {
  const Example2({super.key});

  @override
  final code = 'Container(width: 100, height: 100, color: red)';

  @override
  final String explanation =
      'The red Container wants to be 100x100, but it can\'t, '
      'because the screen forces it to be exactly the same size as the screen'
      '\n\n'
      'So the Container fills the screen';

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

//////////

class Example3 extends Example {
  const Example3({super.key});

  @override
  final code = 'Center(\n'
      '    child: Container(width: 100, height: 100, color:red))';

  @override
  final explanation =
      'The screen forces the Center to be exactly the same size as the screen, '
      'so the Center fills the screen.'
      '\n\n'
      'The Center tells the Container that it can be any size it wants, but not bigger than the screen.'
      'Now the Container can indeed be 100x100.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: red,
      ),
    );
  }
}

//////////////

class Example4 extends Example {
  const Example4({super.key});

  @override
  final code = 'Align(\n)'
      '    alignment: Alignment.bottomRight, \n'
      '    child: Container(width: 100, height: 100, color: red)';

  @override
  final explanation =
      'This is different from the previous example in the it uses Align intem of Center.'
      '\n\n'
      'Align also tells the Container that it can be any size it wants, but if there is empty'
      'Instead, it aligns the Container to the bottom-right of the available space';

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(width: 100, height: 100, color: red));
  }
}

/////////////

class Example5 extends Example {
  const Example5({super.key});

  @override
  final code = 'Center(\n)'
      '    child: Container(\n)'
      '        color: red,\n'
      '        width: double.infinity,\n'
      '        height: double.infinity))';

  @override
  final String explanation =
      'The screen forces the Center to be exactly the same size as the screen'
      'so the Center fills the screen'
      '\n\n'
      'The Center tells the Container that it can be any size it wants, but not bigger than the screen'
      'The Container wants to be of infinite size, but since it can\'t be bigger than the screen, it just fills the screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: red,
      ),
    );
  }
}

/////////

class Example6 extends Example {
  const Example6({super.key});

  @override
  final code = 'Center(child: Container(color: red))';

  @override
  final String explanation =
      'The screen forces the Center to be exactly the same size as the screen'
      'so the Center fills the screen'
      '\n\n'
      'The Center tells the Container that it can be any size it want, but not bigger that the screen'
      '\n\n'
      'But why does the Container decide that?'
      'Simply because that\'s a design decision by those who created the Container widget'
      'It could have been created differently, and you have to read the Container documentaion to understand how it behaves, depending on the circumstance. ';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: red),
    );
  }
}

class Example7 extends Example {
  const Example7({super.key});

  @override
  final code = 'Center(\n)'
      '   child: Container(color: red\n'
      '     child: Container(color: green, width: 30, height: 30)';

  @override
  final String explanation =
      'The screen forces the Center to be exactly the same size as the screen, '
      'so the Center fills the screen.'
      '\n\n'
      'The Center tells the red Container that it can be any size it wants, but not bigger than the screen.'
      'Since the red Container has no size but has a child, it decides it wants to be the same size as its child.'
      '\n\n'
      'The red Container tells its child that it can be any size it wants, but not bigger than the screen.'
      '\n\n'
      'The child is a green Container that wants to be 30x30.'
      '\n\n'
      'Since the red `Container` has no size but has a child, it decides it wants to be the same size as its child. '
      'The red color isn\'t visible, since the green Container entirely covers all of the red Container.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: red),
    );
  }
}

class Example8 extends Example {
  const Example8({super.key});

  @override
  final code = 'Center(\n'
      '    child: Container(color: red\n)'
      '        padding: const EdgeInsets.all(20), \n'
      '        chld: Container(color: green, width: 30, height: 30)';

  @override
  final String explanation =
      'The red Container sizes itself to its children size, but it takes its own padding into consideration. '
      'So it is also 30x30 plus padding. '
      'The red color is visible because of the padding, and the green Container has the same size as in the previous example.';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: const EdgeInsets.all(20),
            color: red,
            child: Container(
              color: green,
              width: 30,
              height: 30,
            )));
  }
}

class Example9 extends Example {
  const Example9({super.key});

  @override
  final code = 'ConstrainedBox('
      'constraints: const BoxConstraints(\n'
      '  minWidth: 70,\n'
      '  minHeight: 70,\n'
      '  maxWidth: 150,\n'
      '  maxHeight: 150,),\n'
      '  child: Container(color: red, width: 10, height: 10,))';

  @override
  final String explanation =
      'Now, Center allows ConstrainedBox to be any size up to the screen size.'
      '\n\n'
      'The ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.'
      '\n\n'
      'The Container must be between 70 and 150 pixels. It wants to have 10 pixels, so it will end up having 70 (the MINIMUM).';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(
        color: red,
        width: 10,
        height: 10,
      ),
    );
  }
}

class Example10 extends Example {
  const Example10({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 10, height: 10))))';
  @override
  final String explanation =
      'Now, Center allows ConstrainedBox to be any size up to the screen size.'
      '\n\n'
      'The ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.'
      '\n\n'
      'The Container must be between 70 and 150 pixels. It wants to have 10 pixels, so it will end up having 70 (the MINIMUM).';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(
          color: red,
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}

class Example11 extends Example {
  const Example11({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 1000, height: 1000))))';

  @override
  final String explanation =
      'Center allows ConstrainedBox to be any size up to the screen size.'
      'The ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child'
      '\n\n'
      'The Container must be between 70 and 150 pixels. It wants to have 1000 pixels, so it ends up having 150 (the MAXIMUM).';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(
          color: red,
          width: 1000,
          height: 1000,
        ),
      ),
    );
  }
}

class Example12 extends Example {
  const Example12({super.key});

  @override
  final code = 'Center(\n'
      '   child: ConstrainedBox(\n'
      '      constraints: BoxConstraints(\n'
      '                 minWidth: 70, minHeight: 70,\n'
      '                 maxWidth: 150, maxHeight: 150),\n'
      '        child: Container(color: red, width: 100, height: 100))))';

  @override
  final String explanation =
      'Center allows ConstrainedBox to be any size up to the screen size.'
      'ConstrainedBox imposes ADDITIONAL constraints from its \'constraints\' parameter onto its child.'
      '\n\n'
      'The Container must be between 70 and 150 pixels. It wants to have 100 pixels, and that\'s the size it has, since that\'s between 70 and 150.';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            minWidth: 70, minHeight: 70, maxWidth: 150, maxHeight: 150),
        child: Container(
          color: red,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}

class Example13 extends Example {
  const Example13({super.key});

  @override
  final code = 'UnconstrainedBox(\n)'
      '   child: Container(color: red, width: 20, height: 20)';

  @override
  final String explanation =
      'The screen forces the UnconstrainedBox to be exactly the same size as the screen.'
      'However, the UnconstrainedBox lets its child Container be any size it wants.';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: red,
        width: 20,
        height: 50,
      ),
    );
  }
}

class Example14 extends Example {
  const Example14({super.key});

  @override
  final code = 'UncosntrainedBox(\n)'
      '    child: Container(color: red, width: 4000, height: 4000)';

  @override
  final String explanation =
      'The screen forces the UnconstrainedBox to be exactly the same size as the screen, '
      'and UnconstrainedBox lets its child Container be any size it wants.'
      '\n\n'
      'Unfortunately, in this case the Container has 4000 pixels of width and is too big to fit in the UnconstrainedBox, '
      'so the UnconstrainedBox displays the much dreaded "overflow warning".';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: red,
        width: 4000,
        height: 5000,
      ),
    );
  }
}

class Example15 extends Example {
  const Example15({super.key});

  @override
  final code = 'OverflowBox(\n'
      '   minWidth: 0'
      '   minHeight: 0'
      '   maxWidth: double.infinity, '
      '   maxHeight: double.infinity'
      '   child: Container(color: red, width: 4000, height: 4000)';

  @override
  final String explanation =
      'The screen forces the OverflowBox to be exactly the same size as the screen, '
      'and OverflowBox lets its child Container be any size it wants.'
      '\n\n'
      'OverflowBox is similar to UnconstrainedBox, and the difference is that it won\'t display any warnings if the child doesn\'t fit the space.'
      '\n\n'
      'In this case the Container is 4000 pixels wide, and is too big to fit in the OverflowBox, '
      'but the OverflowBox simply shows as much as it can, with no warnings given.';

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minWidth: 0,
      minHeight: 0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(
        color: red,
        width: 4000,
        height: 5000,
      ),
    );
  }
}

class Example16 extends Example {
  const Example16({super.key});

  @override
  final code = 'UnconstrainedBox(\n)'
      '   child: Container(color: Colors.red, width: double.infinity, height: 100)';

  @override
  final String explanation =
      'This won\'t render anything, and you\'ll see an error in the console.'
      '\n\n'
      'The UnconstrainedBox lets its child be any size it wants, '
      'however its child is a Container with infinite size.'
      '\n\n'
      'Flutter can\'t render infinite sizes, so it throws an error with the following message: '
      '"BoxConstraints forces an infinite width."';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        color: red,
        width: double.infinity,
        height: 100,
      ),
    );
  }
}

class Example17 extends Example {
  const Example17({super.key});

  @override
  final code = 'UnconstraindBox(\n'
      '    child: LimitedBox(maxWidth: 100,\n'
      '        child: Container(color: red, \n'
      '            width: double.infinity, height: 100)';

  @override
  final String explanation = 'Here you won\'t get an error anymore, '
      'because when the LimitedBox is given an infinite size by the UnconstrainedBox, '
      'it passes a maximum width of 100 down to its child.'
      '\n\n'
      'If you swap the UnconstrainedBox for a Center widget, '
      'the LimitedBox won\'t apply its limit anymore (since its limit is only applied when it gets infinite constraints), '
      'and the width of the Container is allowed to grow past 100.'
      '\n\n'
      'This explains the difference between a LimitedBox and a ConstrainedBox.';

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: LimitedBox(
        maxWidth: 100,
        child: Container(
          color: red,
          width: 4000,
          height: 100,
        ),
      ),
    );
  }
}

class Example18 extends Example {
  const Example18({super.key});

  @override
  final code = 'FittedBox(\n'
      '    child: Text(\'Some Example Text.\'));';

  @override
  final String explanation =
      'The screen forces the FittedBox to be exactly the same size as the screen.'
      'The Text has some natural width (also called its intrinsic width) that depends on the amount of text, its font size, and so on.'
      '\n\n'
      'The FittedBox lets the Text be any size it wants, '
      'but after the Text tells its size to the FittedBox, '
      'the FittedBox scales the Text until it fills all of the available width.';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text('Some Example Text.'),
    );
  }
}

class Example19 extends Example {
  const Example19({super.key});

  @override
  final code = 'Center(\n'
      '   child: FittedBox(\n'
      '       child: Text(\'Some Example Text.\')))';

  @override
  final String explanation = 
    'But what happens if you put the FittedBox inside of a Center widget?'
    'The Center lets the FittedBox';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FittedBox(
          child: Text('Some Example Text'),
      ),
    )
  }
}
