import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_data.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import 'city_search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const CitySearchView();
                }),
              );
            },
          )
        ],
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weatherData: WeatherData(
              location: state.weatherData.location,
              current: state.weatherData.current,
              forecast: state.weatherData.forecast,
            ),
          );
        } else {
          return const Text("Error");
        }
      }),
    );
  }
}