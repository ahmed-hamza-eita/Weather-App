import 'package:weather_app/models/weather_data.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherData weatherData;

  WeatherLoadedState(this.weatherData);
}

class WeatherFailureState extends WeatherState {}