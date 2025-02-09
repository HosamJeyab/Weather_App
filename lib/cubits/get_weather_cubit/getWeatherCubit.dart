import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/services/weatherService.dart';

class Getweathercubit extends Cubit<WeatherState> {
  Getweathercubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFaliuresState(e.toString()));
    }
  }
}
