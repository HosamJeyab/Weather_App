import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/screens/noWeatheBody.dart';
import 'package:weather_app/screens/searchView.dart';
import 'package:weather_app/screens/weatherInfoBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Getweathercubit, WeatherState>(
      builder: (context, state) {
        MaterialColor appBarColor = Colors.blue;

        if (state is WeatherLoadedState) {
          appBarColor = getTheamColor(state.weatherModel.weatherCondition);
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Weather App",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: appBarColor, // تحديث اللون بناءً على الحالة
            centerTitle: true,
          ),
          body: state is WeatherLoadedState
              ? WeatherInfoBody(weatherModel: state.weatherModel)
              : state is WeatherInitialState
                  ? const NoWeatherBody()
                  : const Text('Oops, there was an error, try later'),
        );
      },
    );
  }
}
