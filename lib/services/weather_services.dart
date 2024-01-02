import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  WeatherServices(this.dio);
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '8cefed3720c148908cb100737231212';
  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=8cefed3720c148908cb100737231212&q=Cairo&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later please ';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later pleasee ');
    }
  }
}
