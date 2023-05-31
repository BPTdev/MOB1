import 'dart:convert';
import 'package:http/http.dart' as http;
import '/constants/api_keys.dart';

// request : https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&appid={API key}

class WeatherComponent {
  Future<void> fetchWeather(double latitude, double longitude) async {
  print('fetching weather');
    final String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kWEATER_API_KEY';
print(url);
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        // Process the weather data as needed
        print(decodedData);
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
        print('Body: ${response.body}');
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error: $e');
    }
  }
}
