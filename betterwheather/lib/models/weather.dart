import 'dart:convert';
import 'package:http/http.dart' as http;
import '/constants/api_keys.dart';

// request : https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&appid={API key}

class WeatherComponent {
  Future<Map<String, dynamic>> fetchWeather(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);

        final weatherData = {
          'temp': decodedData['main']['temp'].round().toDouble(),
          'temp_min': decodedData['main']['temp_min'].round().toDouble(),
          'temp_max': decodedData['main']['temp_max'].round().toDouble(),
          'dt': decodedData['dt'],
          'main': decodedData['weather'][0]['main'],
          'icon': decodedData['weather'][0]['icon'],
          'city': decodedData['name'] + ', ' + decodedData['sys']['country'],
        };

        return weatherData;
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error: $e');
    }

    return {}; // Return an empty Map in case of error
  }

  Future<Object> fetchWeathers(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List<Map<String, dynamic>> extractedData = [];

        data['list'].forEach((item) {
          final Map<String, dynamic> extractedItem =
              Map<String, dynamic>.from(item);
          extractedData.add(extractedItem);
        });

        List<Map<String, dynamic>> weathersData = [];

        extractedData.forEach((decodedData) {
          //loop to get only 5 days
          int countDays = 0;
          double minTemp = 0;
          double maxTemp = 0;
          for (int i = 0; i < 5; i++) {
            if(getDayIndexFromTimestamp(decodedData['dt']) == i)
              break;
            else
              continue;
          }

          final weatherData = {
            'temp': decodedData['main']['temp'].round().toDouble(),
            'temp_min': decodedData['main']['temp_min'].round().toDouble(),
            'temp_max': decodedData['main']['temp_max'].round().toDouble(),
            'dt': decodedData['dt'],
            'main': decodedData['weather'][0]['main'],
            'icon': decodedData['weather'][0]['icon'],
            'city': decodedData['name'] + ', ' + decodedData['sys']['country'],
          };

          weathersData.add(weatherData);
        });

        return weathersData;
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error: $e');
    }

    return {}; // Return an empty Map in case of error
  }

  Future<Map<String, dynamic>> fetchWeatherPlace(String placeName) async {
    print('Fetching weather information');
    final url =
        'https://api.openweathermap.org/data/2.5/weather?units=metric&q=$placeName&appid=$kWEATHER_API_KEY';
    return await fetchWeather(url);
  }

  Future<Map<String, dynamic>> fetchWeatherLatLon(
      double latitude, double longitude) async {
    print('Fetching weather information');
    final url =
        'https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitude&lon=$longitude&appid=$kWEATHER_API_KEY';
    return await fetchWeather(url);
  }

  Future<Map<String, dynamic>> fetchWeather5DaysLatLon(
      String cityName, String countryCode) async {
    print('Fetching weather information');
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,$countryCode&appid=$kWEATHER_API_KEY';
    return await fetchWeathers(url);
  }

  int getDayIndexFromTimestamp(int timestamp) {
    DateTime currentDate = DateTime.now();
    DateTime targetDate = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    Duration difference = targetDate.difference(currentDate);

    // Calcul du nombre de jours entre les deux dates
    int dayDiff = difference.inDays;

    if (dayDiff >= 0 && dayDiff < 5) {
      // Le timestamp est dans les 5 prochains jours
      return dayDiff + 1;
    } else {
      // Le timestamp est en dehors des 5 prochains jours
      return -1;
    }
  }
}
