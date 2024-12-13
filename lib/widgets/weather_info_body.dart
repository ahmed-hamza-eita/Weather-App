import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_data.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherData});

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData.location.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(
              "Updated at: ${weatherData.current.lastUpdated}",
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
                    Text(
                      "Max: ${weatherData.forecast.forecastDay[1].day.maxtempC}°C",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Min: ${weatherData.forecast.forecastDay[0].day.mintempC}°C",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
            const Text("Clear Sky",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
