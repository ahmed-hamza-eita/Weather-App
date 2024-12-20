import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/ui/home_view.dart';

//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final dio = Dio();
//   final weatherService = WeatherService(dio);
//
//   try {
//     WeatherData weatherData = await weatherService.getCurrentWeather(cityName: 'cairo');
//     print("Location: ${weatherData.location.name}");
//     print("Temperature: ${weatherData.current.tempC}°C");
//     print("Condition: ${weatherData.current.condition.text}");
//     print("Forecast Max Temp: ${weatherData.forecast.forecastDay[0].day.maxtempC}°C");
//   } catch (e) {
//     print("Error: $e");
//   }
// }
void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),
        ));
  }
}
