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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              width: 100.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width - 200,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.yellow,
                        child: Icon(Icons.mood, color: Colors.black, size: 100),
                      ),
                      SizedBox(height: 40),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child:
                            Icon(Icons.ac_unit, color: Colors.black, size: 100),
                      ),
                    ],
                  ),
                )),
            Container(
              color: Colors.blue,
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
