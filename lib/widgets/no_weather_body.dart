import 'package:flutter/material.dart';
import 'package:weather_app/ui/city_search_view.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CitySearchView();
          }));
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "there is no weather 😔 start",
              style: TextStyle(fontSize: 28),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
