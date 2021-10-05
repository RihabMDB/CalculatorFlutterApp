import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// to import this run: flutter pub add math_expressions => this will add package to dependencie
// to import it run :  dart pub get
import 'package:math_expressions/math_expressions.dart';

import 'widgets/CalButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  CalAppState createState() {
    return CalAppState();
  }
}

class CalAppState extends State<MyApp> {
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void clearAll(String text) {
    setState(() {
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = _expression.substring(0, _expression.length - 1);
    });
  }

  void calcul(String text) {
    Parser p =
        Parser(); // creates a mathematical [Expression] from a given input string.
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFF010038),
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Center(
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("AC", 0xFF916BBF, clearAll),
                          CalButton("%", 0xFF916BBF, numClick),
                          CalButton("/", 0xFF916BBF, numClick),
                          CalButton("C", 0xFF916BBF, clear)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("7", 0xFF141E61, numClick),
                          CalButton("8", 0xFF141E61, numClick),
                          CalButton("9", 0xFF141E61, numClick),
                          CalButton("*", 0xFF916BBF, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("4", 0xFF141E61, numClick),
                          CalButton("5", 0xFF141E61, numClick),
                          CalButton("6", 0xFF141E61, numClick),
                          CalButton("-", 0xFF916BBF, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton("1", 0xFF141E61, numClick),
                          CalButton("2", 0xFF141E61, numClick),
                          CalButton("3", 0xFF141E61, numClick),
                          CalButton("+", 0xFF916BBF, numClick)
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalButton(".", 0xFF141E61, numClick),
                          CalButton("0", 0xFF141E61, numClick),
                          CalButton("( )", 0xFF141E61, numClick),
                          CalButton("=", 0xFFA12568, calcul)
                        ])
                  ],
                ),
              )
            ])));
  }
}
