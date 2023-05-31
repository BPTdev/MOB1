import 'package:flutter/material.dart';
import '/models/location.dart';
import '/constants/design.dart';
import '/models/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

//Design values
  var city = 'London';
  var day = 'Monday';
  var temperature = 20;
  var weather = 'SUNNY';
  List<double> location = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.delivery_dining, color: kTextColors[0], size: kIconSizes[0],),
          onPressed: () {
            WeatherComponent().fetchWeather(location[0], location[1]);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.my_location, color: kTextColors[0], size: kIconSizes[0],),
            onPressed: () {
              updateLocation().then((value) => location = value);
            },
          ),
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(city,
              style: TextStyle(fontSize: kFontSizes[0], color: kTextColors[0]),),
            SizedBox(height: 10.0,),
            Text(day,
              style: TextStyle(fontSize: kFontSizes[1], color: kTextColors[0]),),
            SizedBox(height: 50.0,),
            //Image(image: image),
            Icon(Icons.wb_sunny_outlined, color: kTextColors[0],
              size: kIconSizes[1],),
            SizedBox(height: 50.0,),
            Text('$temperature°',
              style: TextStyle(fontSize: kFontSizes[2], color: kTextColors[0]),),
            SizedBox(height: 20.0,),
            Text(weather,
              style: TextStyle(fontSize: kFontSizes[1], color: kTextColors[0]),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.thermostat, color: kTextColors[1], size: kIconSizes[0],),
                Text('19°', style: TextStyle(
                    fontSize: kFontSizes[1], color: kTextColors[1]),),
                SizedBox(width: 10.0,),
                Icon(Icons.thermostat_auto, color: kTextColors[1],
                  size: kIconSizes[0],),
                Text('20°', style: TextStyle(
                    fontSize: kFontSizes[1], color: kTextColors[1]),),
              ],
            ),
          ],
        ),
      ),
    );
  }


}