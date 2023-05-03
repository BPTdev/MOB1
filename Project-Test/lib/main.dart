import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _randomText = "default text";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _getARandomText();
    });
  }

  void _getARandomText() {
    setState(() {
      _randomText = 'The random text is' + Random().nextInt(100).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(children: [
      Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.red,
          )),
      Container(
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.green,
          )),
      Container(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
    ])));
  }
}
