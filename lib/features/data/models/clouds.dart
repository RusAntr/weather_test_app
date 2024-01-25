import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'clouds.g.dart';

/// Clouds model for json serialization/deserialization of data recieved over network
/// Extends [CloudsEntity] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Clouds extends CloudsEntity {
  const Clouds({
    required num all,
  }) : super(all: all);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}
