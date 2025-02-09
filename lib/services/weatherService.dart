import 'package:dio/dio.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherService {
  final Dio dio;

  final String apikey = '028c0fdc22c64870a95125632250802';
  final String baseUrl = 'https://api.weatherapi.com/v1';

  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessagr = e.response?.data['error']['message'] ??
          'opsss there was an error, try later';
      throw Exception(errorMessagr);
    } catch (e) {
      throw Exception('opsss there was an error, try later');
    }
  }
}
