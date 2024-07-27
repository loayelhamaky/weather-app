import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
// ignore: non_constant_identifier_names
  String baseURL = 'http://api.weatherapi.com/v1';
// ignore: non_constant_identifier_names
  String apiKey = '49a13f4fdcd4423482c132941230306';

  Future<WeatherModel> GetWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseURL/forecast.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);

    Map<String, dynamic> Data = jsonDecode(response.body);
    return WeatherModel.fromJson(Data);
  }
}
