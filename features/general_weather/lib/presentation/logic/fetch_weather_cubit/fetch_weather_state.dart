part of 'fetch_weather_cubit.dart';

class FetchWeatherState with EquatableMixin {
  final WeatherStatus status;
  final String weekDay;
  final String dateToday;
  final String cityName;
  final String temparature;
  final String weather;
  final List<ForcastList>? forcastList;
  final int humidity;
  final int pressure;
  final int wind;

  FetchWeatherState({
    required this.status,
    required this.weekDay,
    required this.dateToday,
    required this.cityName,
    required this.temparature,
    required this.weather,
    required this.forcastList,
    required this.humidity,
    required this.pressure,
    required this.wind,
  });

  factory FetchWeatherState.initial() => FetchWeatherState(
        status: WeatherStatus.loading,
        weekDay: '-',
        dateToday: '-',
        cityName: '-',
        temparature: '-',
        weather: '-',
        humidity: 0,
        pressure: 0,
        wind: 0,
        forcastList: [],
      );

  factory FetchWeatherState.loading() => FetchWeatherState(
        status: WeatherStatus.loading,
        weekDay: '-',
        dateToday: '-',
        cityName: '-',
        temparature: '-',
        weather: '-',
        humidity: 0,
        pressure: 0,
        wind: 0,
        forcastList: [],
      );

  factory FetchWeatherState.loaded(
    String weekDay,
    String dateToday,
    String cityName,
    String temparature,
    String weather,
    int humidity,
    int pressure,
    int wind,
    List<ForcastList> forcastList,
  ) =>
      FetchWeatherState(
        status: WeatherStatus.loaded,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  FetchWeatherState withRefresh(WeatherStatus status) => FetchWeatherState(
        status: status,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  FetchWeatherState withStatus(WeatherStatus status) => FetchWeatherState(
        status: status,
        weekDay: weekDay,
        dateToday: dateToday,
        cityName: cityName,
        temparature: temparature,
        weather: weather,
        humidity: humidity,
        pressure: pressure,
        wind: wind,
        forcastList: forcastList,
      );

  @override
  List<Object?> get props => [
        status,
        weekDay,
        dateToday,
        cityName,
        temparature,
        weather,
        humidity,
        pressure,
        wind,
        forcastList,
      ];
}
