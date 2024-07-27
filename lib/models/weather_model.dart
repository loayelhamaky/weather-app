import 'package:flutter/material.dart';

class WeatherModel {
  double temp;
  DateTime dateTime;
  String WeatherStatus;
  //IconData WeatherIcon;
  double MaxTemp;
  double minTemp;

  WeatherModel(
      {required this.temp,
      required this.dateTime,
      required this.MaxTemp,
      // required this.WeatherIcon,
      required this.WeatherStatus,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var weatherData = data['forecast']['forecastday'][0]['day'];
    print(weatherData);
    return WeatherModel(
      temp: weatherData['avgtemp_c'],
      dateTime: DateTime.parse(data['current']['last_updated']),
      MaxTemp: weatherData['maxtemp_c'],
      //WeatherIcon: IconData(weatherData['condition']['icon']),
      WeatherStatus: weatherData['condition']['text'],
      minTemp: weatherData['mintemp_c'],
    );
  }

  @override
  String toString() {
    return 'temp : $temp';
  }

  String getImage() {
    if (WeatherStatus == 'Sunny' ||
        WeatherStatus == 'Clear' ||
        WeatherStatus == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (WeatherStatus == 'Blizzard' ||
        WeatherStatus == 'Patchy snow possible' ||
        WeatherStatus == 'Patchy sleet possible' ||
        WeatherStatus == 'Patchy freezing drizzle possible' ||
        WeatherStatus == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (WeatherStatus == 'Freezing fog' ||
        WeatherStatus == 'Fog' ||
        WeatherStatus == 'Heavy Cloud' ||
        WeatherStatus == 'Mist' ||
        WeatherStatus == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (WeatherStatus == 'Patchy rain possible' ||
        WeatherStatus == 'Heavy Rain' ||
        WeatherStatus == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (WeatherStatus == 'Thundery outbreaks possible' ||
        WeatherStatus == 'Moderate or heavy snow with thunder' ||
        WeatherStatus == 'Patchy light snow with thunder' ||
        WeatherStatus == 'Moderate or heavy rain with thunder' ||
        WeatherStatus == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (WeatherStatus == 'Sunny' ||
        WeatherStatus == 'Clear' ||
        WeatherStatus == 'partly cloudy') {
      return Colors.orange;
    } else if (WeatherStatus == 'Blizzard' ||
        WeatherStatus == 'Patchy snow possible' ||
        WeatherStatus == 'Patchy sleet possible' ||
        WeatherStatus == 'Patchy freezing drizzle possible' ||
        WeatherStatus == 'Blowing snow') {
      return Colors.blue;
    } else if (WeatherStatus == 'Freezing fog' ||
        WeatherStatus == 'Fog' ||
        WeatherStatus == 'Heavy Cloud' ||
        WeatherStatus == 'Mist' ||
        WeatherStatus == 'Fog') {
      return Colors.blueGrey;
    } else if (WeatherStatus == 'Patchy rain possible' ||
        WeatherStatus == 'Heavy Rain' ||
        WeatherStatus == 'Showers	') {
      return Colors.blue;
    } else if (WeatherStatus == 'Thundery outbreaks possible' ||
        WeatherStatus == 'Moderate or heavy snow with thunder' ||
        WeatherStatus == 'Patchy light snow with thunder' ||
        WeatherStatus == 'Moderate or heavy rain with thunder' ||
        WeatherStatus == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
