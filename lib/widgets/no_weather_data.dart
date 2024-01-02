import 'package:flutter/material.dart';

class NoWeatherData extends StatelessWidget {
  const NoWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather 😔 start ',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'search now 🔍 ',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
