import 'package:equatable/equatable.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

class WeatherEntity extends Equatable {
  /// More in [CoordinatesEntity]
  final CoordinatesEntity? coordinates;

  /// More in [WeatherStateEntity]
  final List<WeatherStateEntity>? weatherState;

  /// Internal parameter
  final String? base;

  /// More in [MainInfoEntity]
  final MainInfoEntity? mainInfo;

  /// Visibility, meter. The maximum value of the visibility is 10 km
  final num? visibility;

  /// More in [WindEntity]
  final WindEntity? wind;

  /// More in [RainEntity]
  final RainEntity? rain;

  /// More in [CloudsEntity]
  final CloudsEntity? clouds;

  /// Time of data calculation, unix, UTC
  final num? dt;

  /// More in [ExtraInfoEntity]
  final ExtraInfoEntity? extraInfo;

  /// Shift in seconds from UTC
  final num? timezone;

  /// City ID
  final num? id;

  /// City name
  final String? name;

  /// Internal OW parameter
  final num? cod;
  const WeatherEntity({
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
  });

  @override
  List<Object?> get props => [
        coordinates,
        weatherState,
        base,
        mainInfo,
        visibility,
        wind,
        rain,
        clouds,
        dt,
        extraInfo,
        timezone,
        id,
        name,
        cod,
      ];
}
