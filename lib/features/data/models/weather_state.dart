import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'weather_state.g.dart';

/// WeatherState model for json serialization/deserialization of data recieved over network
/// Extends [WeatherState] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherState extends WeatherStateEntity {
  const WeatherState({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );
  Map<String, dynamic> toJson() => _$WeatherStateToJson(this);

  factory WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);
}
