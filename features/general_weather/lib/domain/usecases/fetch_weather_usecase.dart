import 'package:core/di/di.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:general_weather/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchWeatherUseCase
    implements BaseUseCase<CityWeather, FetchWeatherRequest> {
  final WeatherRepository weatherRepository;

  FetchWeatherUseCase(this.weatherRepository);

  @override
  Future<CityWeather> call({FetchWeatherRequest? parameters}) =>
      weatherRepository.fetchWeather(
          latitude: parameters!.latitude, longitude: parameters.longitude);
}
