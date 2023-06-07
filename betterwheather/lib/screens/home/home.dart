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
  
  void iconImage(String icon) {
    setState(() {
      icon = icon.substring(0,2);
      weatherImage = 'assets/images/${icon}.png';
    });
  }

//Design values
  var city = 'London';
  var day = 'Monday';
  double temperature = 20;
  double temperatureMin = 15;
  double temperatureMax = 25;
  var icon = '01';
  var weather = 'SUNNY';
  var weatherImage = 'assets/images/01.png';
  List<double> location = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: Icon(Icons.delivery_dining, color: kTextColors[0], size: kIconSizes[0],),
          onPressed: () {
            WeatherComponent().fetchWeather(location[0], location[1]).then((value) {
              setState(() {
                city = value['city'];
                temperature = value['temp'];
                temperatureMin = value['temp_min'];
                temperatureMax = value['temp_max'];
                icon = value['icon'];
                weather = value['main'];
              });
              iconImage(icon);
            });

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
            Image(image: AssetImage(weatherImage), width: kIconSizes[1], height: kIconSizes[1],),
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
                  Icons.arrow_downward, color: kTextColors[1], size: kIconSizes[0],),
                Text('$temperatureMin°', style: TextStyle(
                    fontSize: kFontSizes[1], color: kTextColors[1]),),
                SizedBox(width: 10.0,),
                Icon(Icons.arrow_upward, color: kTextColors[1],
                  size: kIconSizes[0],),
                Text('$temperatureMax°', style: TextStyle(
                    fontSize: kFontSizes[1], color: kTextColors[1]),),
              ],
            ),
          ],
        ),
      ),
    );
  }


}