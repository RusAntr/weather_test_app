import 'package:equatable/equatable.dart';

class WeatherStateEntity extends Equatable {
  /// Weather condition id
  final num? id;

  /// Group of weather parameters (Rain, Snow, Clouds etc.)
  final String? main;

  /// Weather condition within the group.
  final String? description;

  /// Weather icon id
  final String? icon;
  const WeatherStateEntity({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];

  WeatherStateEntity copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherStateEntity(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }
}
