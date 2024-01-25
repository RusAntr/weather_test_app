import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'rain.g.dart';

/// Rain model for json serialization/deserialization of data recieved over network
/// Extends [Rain] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class Rain extends RainEntity {
  const Rain({
    required num oneHour,
  }) : super(
          oneHour: oneHour,
        );

  Map<String, dynamic> toJson() => _$RainToJson(this);

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}
