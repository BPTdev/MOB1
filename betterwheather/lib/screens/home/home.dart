import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../search/search.dart';
import '../forecast/forecast.dart';
import '/models/location.dart';
import '/constants/design.dart';
import '/models/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
  var weatherImage = 'assets/images/Clear.png';
  var backgroundImage = 'assets/images/background/Clear.gif';
  List<double> location = [];

  @override
  void initState() {
    super.initState();
    updateLocation().then((value) {
      location = value; // Update the location list with the fetched values
      fetchWeatherData(
          WeatherComponent().fetchWeatherLatLon(location[0], location[1]));
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
            color: kColors[0],
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
              color: kColors[0],
              size: kIconSizes[0],
            ),
            onPressed: () {
              fetchWeatherData(WeatherComponent()
                  .fetchWeatherLatLon(location[0], location[1]));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('$backgroundImage'),
            // Specify the path to your GIF image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    city,
                    style: TextStyle(
                        fontSize: kFontSizes[0],
                        color: kColors[0],
                        shadows: kTextShadows),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    day,
                    style: TextStyle(
                        fontSize: kFontSizes[1],
                        color: kColors[0],
                        shadows: kTextShadows),
                  ),
                  SizedBox(
                    height: 10.0,
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
                    style: TextStyle(
                        fontSize: kFontSizes[2],
                        color: kColors[0],
                        shadows: kTextShadows),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    weather,
                    style: TextStyle(
                        fontSize: kFontSizes[1], color: kColors[0]),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/images/thermometer_low.png'),
                        width: kIconSizes[0],
                        color: kColors[0],
                      ),
                      Text(
                        '$temperatureMin°',
                        style: TextStyle(
                            fontSize: kFontSizes[1],
                            color: kColors[0],
                            shadows: kTextShadows),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Image(
                        image: AssetImage('assets/images/thermometer_low.png'),
                        width: kIconSizes[0],
                        color: kColors[0],
                      ),
                      Text(
                        '$temperatureMax°',
                        style: TextStyle(
                            fontSize: kFontSizes[1],
                            color: kColors[0],
                            shadows: kTextShadows),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 16,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: kColors[0].withOpacity(0.8),
                        spreadRadius: 1,
                        blurRadius: 0,
                        offset: Offset(
                            0, 0),
                      ),
                    ],
                  ),
                  height: 50.0,
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForecastPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('6 days forecast',
                          style:
                              TextStyle(fontSize: 20.0, color: kColors[1])),
                    ),
                  ),
                ),
              ),
            ),
            if (loading)
              Container(
                color: kColors[1].withOpacity(1),
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
