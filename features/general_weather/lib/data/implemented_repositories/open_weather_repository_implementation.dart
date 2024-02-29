import 'dart:convert';
import 'package:general_weather/domain/domain.dart';
import 'package:general_weather/data/data_sources/data_sources.dart';
import 'package:general_weather/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApi _weatherApi;

  WeatherRepositoryImpl(this._weatherApi);

  @override
  Future<void> init() {
    throw UnimplementedError();
  }

  @override
  Future<CityWeather> fetchWeather(
      {required double latitude, required double longitude}) async {
    final httpResponse = await _weatherApi.fetchWeather(
        latitude: latitude, longitude: longitude);
    var body = httpResponse.body;
    Map<String, dynamic> myMap = jsonDecode(body) as Map<String, dynamic>;
    if (myMap["cod"] is int) {
      String code = myMap["cod"].toString();
      int message = 0;
      final newBody = '{"cod": $code,"message": ${message.toInt()}}';
      body = newBody;
    }

    CityWeather weatherResponse =
        CityWeather.fromJson(jsonDecode(body) as Map<String, dynamic>);

    return weatherResponse;
  }
}
