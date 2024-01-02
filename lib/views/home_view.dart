import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info.dart';

import '../widgets/no_weather_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is WeatherSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NoWeatherData()));
          } else if (state is WeatherErrorState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeatherInfo()));
          }
          var cubit = WeatherCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Weather App'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView()));
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
