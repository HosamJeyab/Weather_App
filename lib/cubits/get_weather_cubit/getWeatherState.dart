import 'package:weather_app/models/weatherModel.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFaliuresState extends WeatherState {
  final String errorMessage;

  WeatherFaliuresState(this.errorMessage);
}
