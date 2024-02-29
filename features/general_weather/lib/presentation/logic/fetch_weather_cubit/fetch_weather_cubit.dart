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
    print('initialize called');
    CityDesc city = listOfCities.cities[0];
    double latitude = city.latitude;
    double longitiude = city.longitude;
    fetchWeather(latitude, longitiude);
  }

  void fetchWeather(double latitude, double longitude) async {
    FetchWeatherRequest request =
        FetchWeatherRequest(latitude: latitude, longitude: longitude);
    CityWeather response = await _fetchWeatherUseCase.call(parameters: request);

    var code = response.cod;
    if (code!.contains('200')) {
      print('success');
    } else {
      print('failed');
    }
  }
}
