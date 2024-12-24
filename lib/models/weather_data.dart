class WeatherData {
  Location location;
  Current current;
  Forecast forecast;

  WeatherData({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}

class Location {
  String name;

  Location({required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
    );
  }
}

class Current {
  DateTime lastUpdated;
  double tempC;
  int isDay;
  Condition condition;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdated: DateTime.parse(json['last_updated']),
      tempC: json['temp_c'],
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
    );
  }
}

class Condition {
  String text;
  String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
    );
  }
}

class Forecast {
  List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastDay: (json['forecastday'] as List)
          .map((item) => ForecastDay.fromJson(item))
          .toList(),
    );
  }
}

class ForecastDay {
  String date;
  Day day;

  ForecastDay({required this.date, required this.day});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
    );
  }
}

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json['maxtemp_c'],
      mintempC: json['mintemp_c'],
      avgtempC: json['avgtemp_c'],
    );
  }
}
// final weatherData = WeatherData.fromJson(json);
// print("Location: ${weatherData.location.name}");
// print("Temperature: ${weatherData.current.tempC}°C");
// print("Condition: ${weatherData.current.condition.text}");
// print("Forecast Max Temp: ${weatherData.forecast.forecastDay[0].day.maxtempC}°C");
