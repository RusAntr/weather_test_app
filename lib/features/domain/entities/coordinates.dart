import 'package:equatable/equatable.dart';

class CoordinatesEntity extends Equatable {
  /// Latitude
  final num lat;

  /// Longitude
  final num lon;
  const CoordinatesEntity({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [lat, lon];

  CoordinatesEntity copyWith({
    num? lat,
    num? lon,
  }) {
    return CoordinatesEntity(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }
}
