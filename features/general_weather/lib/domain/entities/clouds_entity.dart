import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clouds_entity.g.dart';

@JsonSerializable()
class Clouds extends Equatable {
  final int? all;

  const Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  @override
  List<Object?> get props => [
        all,
      ];
}
