import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'wind.g.dart';

/// Wind model for json serialization/deserialization of data recieved over network
/// Extends [Wind] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Wind extends WindEntity {
  const Wind({
    num? speed,
    num? deg,
    num? gust,
  }) : super(
          speed: speed,
          deg: deg,
          gust: gust,
        );
  Map<String, dynamic> toJson() => _$WindToJson(this);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
