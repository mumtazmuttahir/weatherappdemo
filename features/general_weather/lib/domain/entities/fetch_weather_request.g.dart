// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_weather_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchWeatherRequest _$FetchWeatherRequestFromJson(Map<String, dynamic> json) =>
    FetchWeatherRequest(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$FetchWeatherRequestToJson(
        FetchWeatherRequest instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
