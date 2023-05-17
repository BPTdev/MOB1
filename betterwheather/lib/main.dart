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
      title: 'Better Weahter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
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
  static const textColors = [Colors.white, Colors.white70];
  static const backgroundColor = Colors.black;
  static const fontSizes = <double>[40.0, 30.0, 90.0];
  static const iconSizes = <double>[30.0, 150.0];

  var city = 'London';
  var day = 'Monday';
  var temperature = 20;
  var weather = 'SUNNY';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.search, color: textColors[0], size: iconSizes[0],),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location, color: textColors[0], size: iconSizes[0],),
            onPressed: () {},
          ),],
      ),
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(city, style: TextStyle(fontSize: fontSizes[0], color: textColors[0]),),
            SizedBox(height: 10.0,),
            Text(day, style: TextStyle(fontSize: fontSizes[1], color: textColors[0]),),
            SizedBox(height: 50.0,),
            Image(image: image)
            Icon(Icons.wb_sunny_outlined, color: textColors[0], size: iconSizes[1],),
            SizedBox(height: 50.0,),
            Text('$temperature°', style: TextStyle(fontSize: fontSizes[2], color: textColors[0]),),
            SizedBox(height: 20.0,),
            Text(weather, style: TextStyle(fontSize: fontSizes[1], color: textColors[0]),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.thermostat, color: textColors[1], size: iconSizes[0],),
                Text('19°', style: TextStyle(fontSize: fontSizes[1], color: textColors[1]),),
                SizedBox(width: 10.0,),
                Icon(Icons.thermostat_auto, color: textColors[1], size: iconSizes[0],),
                Text('20°', style: TextStyle(fontSize: fontSizes[1], color: textColors[1]),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
