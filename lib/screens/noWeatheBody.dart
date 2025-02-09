import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "there is no weather 😢 yet",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "searching now 🔍",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
