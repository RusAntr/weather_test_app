import 'package:equatable/equatable.dart';

class MainInfoEntity extends Equatable {
  /// Temperature. Unit Default: Metric
  final num? temp;

  /// This temperature parameter accounts for the human perception of weather.
  final num? feelsLike;

  /// Minimum  temperature at the moment.
  final num? tempMin;

  /// Maximum temperature at the moment.
  final num? tempMax;

  /// Atmospheric pressure on the sea level, hPa
  final num? pressure;

  /// Humidity, %
  final num? humidity;

  /// Atmospheric pressure on the sea level, hPa
  final num? seaLevel;

  /// Atmospheric pressure on the ground level, hPa
  final num? grndLevel;
  const MainInfoEntity({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];

  MainInfoEntity copyWith({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,
  }) {
    return MainInfoEntity(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }
}
