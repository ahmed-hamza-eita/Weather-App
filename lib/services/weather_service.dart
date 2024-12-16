import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/models/weather_data.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseUrl = "https://api.weatherapi.com/v1";
  static const String apiKey = "949d4e258bd04021a58235350241212";

  Future<WeatherData> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio
          .get("$baseUrl/v1/forecast.json?key=$apiKey&q=$cityName&days=1");

      if (response.statusCode == 201) {
        WeatherData weatherData = WeatherData.fromJson(response.data);

        return weatherData;
      } else {
        final String errorMsg = response.data['error']['message'];
        throw Exception(errorMsg);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching weather data: $e");
      }

      rethrow;
    }
  }
}
