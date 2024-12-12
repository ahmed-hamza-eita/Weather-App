import 'package:flutter/material.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "City Name",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Updated at: 12:00 PM",
              style: TextStyle(fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/clear.png", width: 100, height: 100),
                const Text("30°C", style: TextStyle(fontSize: 48)),
                const Column(
                  children: [
                    Text("Max: 32°C", style: TextStyle(fontSize: 18)),
                    Text("Min: 28°C", style: TextStyle(fontSize: 18)),
                  ],
                )
              ],
            ),
            const Text("Clear Sky",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
