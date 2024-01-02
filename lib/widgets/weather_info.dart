import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<WeatherCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.weatherModel!.date ?? '',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Text('', style: TextStyle(fontSize: 24)),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage(weatherModel.weatherModel!.image ?? '')),
              Text(weatherModel.weatherModel!.temp ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    weatherModel.weatherModel!.cityName ?? '',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    weatherModel.weatherModel!.maxTemp ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(weatherModel.weatherModel!.minTemp ?? ''),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            weatherModel.weatherModel!.weatherStatus ?? '',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
