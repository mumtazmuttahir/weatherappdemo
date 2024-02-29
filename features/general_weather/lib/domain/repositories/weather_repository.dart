import 'package:core/di/di.dart';
import 'package:general_weather/domain/domain.dart';

abstract class WeatherRepository extends BaseRepository {
  Future<CityWeather> fetchWeather({
    required double latitude,
    required double longitude,
  });
}
