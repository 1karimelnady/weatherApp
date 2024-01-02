import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/widgets/weather_info.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_outlined),
                color: Colors.white,
              ),
              title: Text(
                'Search a City ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: TextFormField(
                  onFieldSubmitted: (value) async {
                    cubit.getWeatherData(cityName: value);
                    Navigator.pop(context);
                  },
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Enter City Name',
                      labelText: 'Search',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

WeatherModel? weatherModel;
