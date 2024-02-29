// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeather _$CityWeatherFromJson(Map<String, dynamic> json) => CityWeather(
      cod: json['cod'] as String,
      message: json['message'] as int,
      cnt: json['cnt'] as int?,
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ForcastList.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityWeatherToJson(CityWeather instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
