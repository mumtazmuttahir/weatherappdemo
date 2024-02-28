import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'entities.dart';

part 'list_entity.g.dart';

@JsonSerializable()
class ForcastList extends Equatable {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Rain? rain;
  final Sys? sys;
  final String? dtTxt;

  const ForcastList(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.rain,
      this.sys,
      this.dtTxt});

  factory ForcastList.fromJson(Map<String, dynamic> json) =>
      _$ForcastListFromJson(json);

  Map<String, dynamic> toJson() => _$ForcastListToJson(this);

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        rain,
        sys,
        dtTxt,
      ];
}
