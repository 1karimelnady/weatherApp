import 'package:flutter/foundation.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final String temp;
  final String maxTemp;
  final String minTemp;
  final String weatherStatus;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['Cairo'],
      date: json['current']['last_updated'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherStatus: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }
}
