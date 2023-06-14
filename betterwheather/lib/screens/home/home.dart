import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../search/search.dart';
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
  var backgroundImage = '';
  List<double> location = [];

  @override
  void initState() {
    super.initState();
    updateLocation().then((value) {
      location = value; // Update the location list with the fetched values
      fetchWeatherData(WeatherComponent().fetchWeatherLatLon(location[0], location[1]));
    });
  }

  Future<void> fetchWeatherData(Future<Map<String, dynamic>> value) async {
    try {
      setState(() {
        loading = true;
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


  void iconImage(String icon) {
    setState(() {
      weatherImage = 'assets/images/$icon.png';
      backgroundImage = 'assets/images/background/$icon.gif';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: kTextColors[0],
            size: kIconSizes[0],
          ),
          onPressed: () async {
            final result = await Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchPage()));
            final searchValue = await result;
            fetchWeatherData(WeatherComponent().fetchWeatherPlace(searchValue));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.my_location,
              color: kTextColors[0],
              size: kIconSizes[0],
            ),
            onPressed: () {
              fetchWeatherData(WeatherComponent().fetchWeatherLatLon(location[0], location[1]));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$backgroundImage'), // Specify the path to your GIF image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  city,
                  style:
                  TextStyle(fontSize: kFontSizes[0], color: kTextColors[0]),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  day,
                  style:
                  TextStyle(fontSize: kFontSizes[1], color: kTextColors[0]),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Image(
                  image: AssetImage(weatherImage),
                  width: kIconSizes[1],
                  height: kIconSizes[1],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  '$temperature°',
                  style:
                  TextStyle(fontSize: kFontSizes[2], color: kTextColors[0]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  weather,
                  style:
                  TextStyle(fontSize: kFontSizes[1], color: kTextColors[0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: kTextColors[1],
                      size: kIconSizes[0],
                    ),
                    Text(
                      '$temperatureMin°',
                      style: TextStyle(
                          fontSize: kFontSizes[1], color: kTextColors[1]),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.arrow_upward,
                      color: kTextColors[1],
                      size: kIconSizes[0],
                    ),
                    Text(
                      '$temperatureMax°',
                      style: TextStyle(
                          fontSize: kFontSizes[1], color: kTextColors[1]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (loading)
            Container(
              color: Colors.black.withOpacity(1),
              child: Center(
                child: SpinKitSpinningCircle(
                  color: Colors.purpleAccent, // Customize the color as needed
                ),
              ),
            ),
        ],
        ),
      ),
    );
  }
}
