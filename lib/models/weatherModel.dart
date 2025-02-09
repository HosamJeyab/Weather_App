import 'dart:ffi';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double timp;
  final double maxTimp;
  final double minTimp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.timp,
      required this.maxTimp,
      required this.minTimp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['current']['condition']['icon'],
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      timp: json['current']['temp_c'],
      maxTimp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTimp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
