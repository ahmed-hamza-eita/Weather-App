import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';

ThemeData getThemeBasedOnWeather(WeatherData weatherData) {
  switch (weatherData.current.condition.text.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.blue[100],
      );
    case 'cloudy':
    case 'overcast':
      return ThemeData(
        primaryColor: Colors.grey,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[300],
      );
    case 'rainy':
    case 'drizzle':
      return ThemeData(
        primaryColor: Colors.blueGrey,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.blueGrey[700],
      );
    case 'snow':
    case 'sleet':
      return ThemeData(
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white70,
      );
    default:
      return ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.blue[100],
      );
  }
}
