import 'dart:developer';

import 'package:dio/dio.dart';
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
      WeatherData weatherData = WeatherData.fromJson(response.data);
      return weatherData;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']
          ['message']; // ? means if response is null, don't throw an error
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops! Something went wrong");
    }
  }
}
