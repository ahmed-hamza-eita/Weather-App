import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  late WeatherData weatherData;

  getCurrentWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherData =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState(weatherData));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
