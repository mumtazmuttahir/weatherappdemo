import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'entities.dart';

part 'city_weather_entity.g.dart';

@JsonSerializable()
class CityWeather extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForcastList>? list;
  final City? city;

  const CityWeather({this.cod, this.message, this.cnt, this.list, this.city});

  factory CityWeather.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);

  @override
  List<Object?> get props => [
        cod,
        message,
        cnt,
        list,
        city,
      ];
}
