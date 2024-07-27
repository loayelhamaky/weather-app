import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/weather_serves/weather_service.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  late String CityName;

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: (data) async {
              CityName = data;
              WeatherService weatherService = WeatherService();
              WeatherModel weather =
                  await weatherService.GetWeather(cityName: CityName);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  CityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: 'Enter City Name',
                label: const Text('Search'),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();

                      WeatherModel? weather =
                          await service.GetWeather(cityName: CityName);

                      Provider.of<WeatherProvider>(context, listen: false)
                          .weatherData = weather;
                      Provider.of<WeatherProvider>(context, listen: false)
                          .cityName = CityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder()),
          ),
        ),
      ),
    );
  }
}
