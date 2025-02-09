import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<Getweathercubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getTheamColor(weatherModel.weatherCondition),
          getTheamColor(weatherModel.weatherCondition)[300]!,
          getTheamColor(weatherModel.weatherCondition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https:${weatherModel.image!}'),
                Text(
                  'Temp: ${weatherModel.timp.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Max Temp: ${weatherModel.maxTimp.round().toString()}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Min Temp: ${weatherModel.minTimp.round().toString()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
