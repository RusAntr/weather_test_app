import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'place.g.dart';

/// Place model for json serialization/deserialization of data recieved over network
/// Extends [Place] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Place extends PlaceEntity {
  const Place({
    required num lat,
    required num lon,
    required String name,
    Map<String, dynamic>? localNames,
    required String country,
    required String state,
  }) : super(
          lat: lat,
          lon: lon,
          name: name,
          localNames: localNames,
          country: country,
          state: state,
        );

  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
