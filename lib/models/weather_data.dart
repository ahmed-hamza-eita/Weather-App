class WeatherData {
  Location location;
  Current current;

  WeatherData({
    required this.location,
    required this.current,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current": current.toJson(),
  };
}

class Location {
  String name;
  String localtime;

  Location({
    required this.name,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "localtime": localtime,
  };
}

class Current {
  String lastUpdated;
  double tempC;
  Condition condition;
  Forecast? forecast;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.condition,
    this.forecast,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"]?.toDouble(),
    condition: Condition.fromJson(json["condition"]),
    forecast: json.containsKey("forecast") ? Forecast.fromJson(json["forecast"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "condition": condition.toJson(),
    if (forecast != null) "forecast": forecast?.toJson(),
  };
}

class Condition {
  String? text; // Changed to String? as it can be null
  String icon;


  Condition({
    this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    if (text != null) "text": text,
    "icon": icon,

  };
}

class Forecast {
  List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: (json['forecastday'] as List)
        .map((e) => ForecastDay.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday.map((e) => e.toJson()).toList(),
  };
}

class ForecastDay {
  String date;
  Day day;

  ForecastDay({required this.date, required this.day});

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
    date: json["date"],
    day: Day.fromJson(json["day"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "day": day.toJson(),
  };
}

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;
  Condition condition;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"]?.toDouble(),
    mintempC: json["mintemp_c"]?.toDouble(),
    avgtempC: json["avgtemp_c"]?.toDouble(),
    condition: Condition.fromJson(json["condition"]),
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "mintemp_c": mintempC,
    "avgtemp_c": avgtempC,
    "condition": condition.toJson(),
  };
}