import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherData = BlocProvider.of<GetWeatherCubit>(context).weatherData;

    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData.location.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "Updated at: ${weatherData.current.lastUpdated.hour}:${weatherData.current.lastUpdated.minute}",
              style: const TextStyle(fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weatherData.current.condition.icon}",
                  width: 100,
                  height: 100,
                ),
                Text(
                  "${weatherData.current.tempC}°C",
                  style: const TextStyle(fontSize: 48),
                ),
                Column(
                  children: [
                    if (weatherData.forecast.forecastDay.isNotEmpty)
                      Text(
                        "Max: ${weatherData.forecast.forecastDay[0].day.maxtempC}°C",
                        style: const TextStyle(fontSize: 18),
                      ),
                    if (weatherData.forecast.forecastDay.isNotEmpty)
                      Text(
                        "Min: ${weatherData.forecast.forecastDay[0].day.mintempC}°C",
                        style: const TextStyle(fontSize: 18),
                      ),
                  ],
                )
              ],
            ),
            Text(
              weatherData.current.condition.text,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
