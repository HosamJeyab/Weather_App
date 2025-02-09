import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/screens/homepage.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: Builder(
        builder: (context) => BlocBuilder<Getweathercubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getTheamColor(
                  BlocProvider.of<Getweathercubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getTheamColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light drizzle':
    case 'Patchy light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
      return Colors.cyan;
    case 'Blizzard':
      return Colors.indigo;
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Blowing snow':
      return Colors.teal;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.blueGrey;
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}
