import 'package:flutter/material.dart';
import '/models/location.dart';
import '/constants/design.dart';
import '/models/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;
  var city = '';
  var day = '';
  double temperature = 0;
  double temperatureMin = 0;
  double temperatureMax = 0;
  var icon = '';
  var weather = '';
  var weatherImage = '';
  List<double> location = [];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      setState(() {
        loading = true;
      });
      location = await updateLocation();
      final value = await WeatherComponent().fetchWeather(location[0], location[1]);
      setState(() {
        city = value['city'];
        temperature = value['temp'];
        temperatureMin = value['temp_min'];
        temperatureMax = value['temp_max'];
        weather = value['main'];
      });
      iconImage(weather);
    } catch (e) {
      // Handle any error that occurs during weather fetching or location updating
      throw Exception('Error fetching weather data: $e');
    }finally {
      setState(() {
        loading = false;
      });
    }
  }

  void iconImage(String icon) {
    setState(() {
      weatherImage = 'assets/images/$icon.png';
    });
  }
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