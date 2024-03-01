import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_weather/configs/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:shared_design_components/constants/constants.dart';

part 'fetch_weather_state.dart';

@Injectable()
class FetchWeatherCubit extends Cubit<FetchWeatherState> {
  final FetchWeatherUseCase _fetchWeatherUseCase;
  FetchWeatherCubit(this._fetchWeatherUseCase)
      : super(FetchWeatherState.initial());

  List<ForcastList> list = [];
  String cityName = '';

  void initialize() {
    CityDesc city = listOfCities.cities[0];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    emit(FetchWeatherState.loading());
    fetchWeather(latitude, longitiude);
  }

  void refrestWeather() async {
    CityDesc city = listOfCities.cities[0];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    emit(state.withStatus(WeatherStatus.refreshing));
    await Future.delayed(const Duration(milliseconds: 5000));
    fetchWeather(latitude, longitiude);
  }

  void fetchNewCity(int cityNumber) {
    CityDesc city = listOfCities.cities[cityNumber];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    emit(state.withStatus(WeatherStatus.loading));
    fetchWeather(latitude, longitiude);
  }

  void fetchWeather(double latitude, double longitude) async {
    FetchWeatherRequest request =
        FetchWeatherRequest(latitude: latitude, longitude: longitude);
    CityWeather response = await _fetchWeatherUseCase.call(parameters: request);

    var code = response.cod;
    if (int.parse(code) == 200) {
      var date =
          DateTime.fromMillisecondsSinceEpoch(response.list![0].dt * 1000);
      String weekDay = Weekday.getWeekday(date.weekday);
      String dateNow =
          '${date.day} ${Month.getMonthName(date.month)} ${date.year}';
      cityName = response.city!.name;
      double currentTemparature = response.list![0].main.temp - klevinConstant;
      String weather = response.list![0].weather[0].main;
      int humidity = response.list![0].main.humidity;
      int pressure = response.list![0].main.pressure;
      double wind = response.list![0].wind.speed;

      list = [];
      for (int index = 0; index < response.list!.length; index += 7) {
        list.add(response.list![index]);
        if (list.length == 5) {
          break;
        }
      }

      emit(FetchWeatherState.loaded(
        weekDay,
        dateNow,
        cityName,
        currentTemparature,
        weather,
        humidity,
        pressure,
        wind,
        list,
      ));
    } else {
      emit(state.withStatus(WeatherStatus.error));
    }
  }

  void updateWeatherForADay(int index) {
    ForcastList instance = list[index];
    var date = DateTime.fromMillisecondsSinceEpoch(instance.dt * 1000);
    String weekDay = Weekday.getWeekday(date.weekday);
    String dateNow =
        '${date.day} ${Month.getMonthName(date.month)} ${date.year}';

    double currentTemparature = instance.main.temp - klevinConstant;
    String weather = instance.weather[0].main;
    int humidity = instance.main.humidity;
    int pressure = instance.main.pressure;
    double wind = instance.wind.speed;
    emit(FetchWeatherState.loaded(
      weekDay,
      dateNow,
      cityName,
      currentTemparature,
      weather,
      humidity,
      pressure,
      wind,
      list,
    ));
  }
}
