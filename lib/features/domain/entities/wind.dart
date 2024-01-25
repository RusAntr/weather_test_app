import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  /// Wind speed. Unit Default: meter/sec,
  final num? speed;

  /// Wind direction, degrees (meteorological)
  final num? deg;

  /// Wind gust. Unit Default: meter/sec
  final num? gust;
  const WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];

  WindEntity copyWith({
    num? speed,
    num? deg,
    num? gust,
  }) {
    return WindEntity(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }
}
