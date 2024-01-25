// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/data/models/models.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'weather.g.dart';

/// Weather model for json serialization/deserialization of data recieved over network
/// Extends [Weather] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Weather extends WeatherEntity {
  @override
  @JsonKey(name: 'coord')
  final Coordinates? coordinates;
  @override
  @JsonKey(name: 'weather')
  final List<WeatherState>? weatherState;
  @override
  final String? base;
  @override
  @JsonKey(name: 'main')
  final MainInfo? mainInfo;
  @override
  final num? visibility;
  @override
  final Wind? wind;
  @override
  final Rain? rain;
  @override
  final Clouds? clouds;
  @override
  final num? dt;
  @override
  @JsonKey(name: 'sys')
  final ExtraInfo? extraInfo;
  @override
  final num? timezone;
  @override
  final num? id;
  @override
  final String? name;
  @override
  final num? cod;
  const Weather({
    this.weatherState,
    this.coordinates,
    this.base,
    this.mainInfo,
    this.visibility,
    this.wind,
    this.rain,
    this.clouds,
    this.dt,
    this.extraInfo,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  }) : super();
  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
