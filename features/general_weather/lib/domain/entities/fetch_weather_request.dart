import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_weather_request.g.dart';

@JsonSerializable()
class FetchWeatherRequest with EquatableMixin {
  final double latitude;
  final double longitude;

  const FetchWeatherRequest({required this.latitude, required this.longitude});
  factory FetchWeatherRequest.fromJson(Map<String, dynamic> json) =>
      _$FetchWeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FetchWeatherRequestToJson(this);

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
