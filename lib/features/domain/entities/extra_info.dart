import 'package:equatable/equatable.dart';

class ExtraInfoEntity extends Equatable {
  /// Internal OW parameter
  final num? type;

  ///  Internal OW parameter
  final num? id;

  /// Country code (GB, JP etc.)
  final String? country;

  /// Sunrise time, unix, UTC
  final num? sunrise;

  /// Sunset time, unix, UTC
  final num? sunset;
  const ExtraInfoEntity({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];

  ExtraInfoEntity copyWith({
    num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,
  }) {
    return ExtraInfoEntity(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }
}
