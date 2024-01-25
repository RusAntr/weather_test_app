import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'coordinates.g.dart';

/// Coordinates model for json serialization/deserialization of data recieved over network
/// Extends [Coordinates] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Coordinates extends CoordinatesEntity {
  const Coordinates({
    required num lat,
    required num lon,
  }) : super(
          lat: lat,
          lon: lon,
        );

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
