import 'package:flutter/material.dart';
import 'dart:math';

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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void randomImage(){
    setState(() {
      Random random = Random();
      int image1 = random.nextInt(6)+1;
      image1Path = 'assets/images/dice$image1.png';
      int image2 = random.nextInt(6)+1;
      image2Path = 'assets/images/dice$image2.png';
    });

  }

  String image1Path = 'assets/images/dice2.png';
  String image2Path = 'assets/images/dice4.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            'Dicee',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: ()  {
                    randomImage();
                  },
                  child:
                Image(
                  image: AssetImage(image1Path),
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                ),
                ElevatedButton(
                  onPressed: ()  {
                    randomImage();
                  },
                  child:
                Image(
                  image: AssetImage(image2Path),
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
