import 'package:equatable/equatable.dart';

class PlaceEntity extends Equatable {
  /// Latitude
  final num lat;

  /// Longitude
  final num lon;

  /// Name of a location
  final String name;

  /// Translations of [name] to other languages
  final Map<String, dynamic>? localNames;

  /// Country code
  final String country;

  /// State of the found location
  final String state;
  const PlaceEntity({
    required this.lat,
    required this.lon,
    required this.name,
    this.localNames,
    required this.country,
    required this.state,
  });

  @override
  List<Object?> get props => [lat, lon, name, localNames, country, state];

  PlaceEntity copyWith({
    num? lat,
    num? lon,
    String? name,
    Map<String, String>? localNames,
    String? country,
    String? state,
  }) {
    return PlaceEntity(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      name: name ?? this.name,
      localNames: localNames ?? this.localNames,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }
}
