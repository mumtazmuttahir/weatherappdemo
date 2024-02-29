// import 'package:collection/collection.dart';
// import 'dart:html';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
// import 'package:intl/intl.dart';
import 'package:general_weather/domain/domain.dart';
import 'package:shared_design_components/constants/constants.dart';

part 'fetch_weather_state.dart';

@Injectable()
class FetchWeatherCubit extends Cubit<FetchWeatherState> {
  final FetchWeatherUseCase _fetchWeatherUseCase;
  // final _weatherDateFormat = DateFormat('dddd MMMM yyyy');
  FetchWeatherCubit(this._fetchWeatherUseCase)
      : super(FetchWeatherState.initial());

  void initialize() {
    CityDesc city = listOfCities.cities[0];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    emit(FetchWeatherState.loading());
    fetchWeather(latitude, longitiude);
  }

  void refrestWeather() {
    CityDesc city = listOfCities.cities[0];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    fetchWeather(latitude, longitiude);
  }

  void fetchWeather(double latitude, double longitude) async {
    emit(state.withStatus(WeatherStatus.loading));
    FetchWeatherRequest request =
        FetchWeatherRequest(latitude: latitude, longitude: longitude);
    CityWeather response = await _fetchWeatherUseCase.call(parameters: request);

    var code = response.cod;
    if (code!.contains('200')) {
      var date =
          DateTime.fromMillisecondsSinceEpoch(response.list![0].dt! * 1000);
      String weekDay = Weekday.getWeekday(date.weekday);
      String dateNow = '${date.day} ${date.month} ${date.year}';
      String cityName = response.city!.name!;
      double currentTemparature = response.list![0].main!.temp! - 273.16;
      String weather = response.list![0].weather![0].main!;
      int humidity = response.list![0].main!.humidity!;
      int pressure = response.list![0].main!.pressure!;
      double wind = response.list![0].wind!.speed!;

      List<ForcastList> list = [];
      for (int index = 0; index < response.list!.length; index++) {
        if (index % 7 == 0) {
          list.add(response.list![index]);
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

      // emit(FetchWeatherState.loaded());
    } else {
      print('failed');
      emit(state.withStatus(WeatherStatus.error));
    }
  }
}
