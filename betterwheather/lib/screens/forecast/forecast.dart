import 'package:flutter/material.dart';

import '../../constants/design.dart';
import '../../models/location.dart';
import '../../models/weather.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();


}

void iconImage(String icon) {
  setState(() {
    weatherImage = 'assets/images/$icon.png';
    backgroundImage = 'assets/images/background/$icon.gif';
  });
}

class _ForecastPageState extends State<ForecastPage> {
  bool loading = true;
  var city = '';
  var day = '';
  double temperature = 0;
  double temperatureMin = 0;
  double temperatureMax = 0;
  var icon = '';
  var weather = '';
  var weatherImage = 'assets/images/Clear.png';
  var backgroundImage = 'assets/images/background/Clear.gif';
  List<double> location = [];



  @override
  void initState() {
    loading = true;
    super.initState();
    updateLocation().then((value) {
      var location = value; // Update the location list with the fetched values
      fetchWeatherData6Days(
          WeatherComponent().fetchWeatherLatLon(location[0], location[1]));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: kColors[1],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(''),
            // Specify the path to your GIF image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Row(
              //Day 1 & 2
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                child: Container(
                  //Day 1
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Day 1',
                          style: TextStyle(fontSize: kFontSizes[1], color: kColors[0])),
                      Text('Icon'),
                      Text('Temp'),
                      Text('Description'),
                    ],
                  ),

                ),
                ),
                Expanded(
                  child: SizedBox(width: 20.0),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> fetchWeatherData6Days(Future<Map<String, dynamic>> value) async {
    try {
      setState(() {
        var loading = true;
      });
      location = await updateLocation();
      final weatherData = await value;

      setState(() {
        city = weatherData['city'];
        temperature = weatherData['temp'];
        temperatureMin = weatherData['temp_min'];
        temperatureMax = weatherData['temp_max'];
        weather = weatherData['main'];
      });
      iconImage(weather);
    } catch (e) {
      // Handle any error that occurs during weather fetching or location updating
      throw Exception('Error fetching weather data: $e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

}
