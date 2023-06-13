import 'dart:convert';
import 'package:http/http.dart' as http;
import '/constants/api_keys.dart';

// request : https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&appid={API key}

class WeatherComponent {
  Future<Map<String, dynamic>> fetchWeather(double latitude, double longitude) async {
    print('Fetching weather informations');
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitude&lon=$longitude&appid=$kWEATHER_API_KEY';
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
          'city': decodedData['name'],
        };

        return weatherData;
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
        return {}; // Return an empty Map in case of error
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error: $e');
      return {}; // Return an empty Map in case of error
    }
  }

}



