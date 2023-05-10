import 'package:flutter/material.dart';
import 'package:xylofone/widgets/xylofone_key.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
  int _height = 100;
  int _size = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'C',
              keyColor: Color.fromRGBO(255, 0, 0, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'D',
              keyColor: Color.fromRGBO(255, 153, 0, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'E',
              keyColor: Color.fromRGBO(255, 250, 0, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'F',
              keyColor: Color.fromRGBO(17, 255, 0, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'G',
              keyColor: Color.fromRGBO(16, 143, 0, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'A',
              keyColor: Color.fromRGBO(0, 182, 255, 1.0),
            ),
            XylofonKey(
              iconSize: _size,
              sizedBoxSize: _height,
              keyText: 'B',
              keyColor: Color.fromRGBO(238, 0, 255, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
