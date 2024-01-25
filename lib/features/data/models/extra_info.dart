import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'extra_info.g.dart';

/// ExtraInfo model for json serialization/deserialization of data recieved over network
/// Extends [ExtraInfo] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class ExtraInfo extends ExtraInfoEntity {
  const ExtraInfo({
    num? type,
    num? id,
    String? country,
    num? sunrise,
    num? sunset,
  }) : super(
          type: type,
          id: id,
          country: country,
          sunrise: sunrise,
          sunset: sunset,
        );

  Map<String, dynamic> toJson() => _$ExtraInfoToJson(this);

  factory ExtraInfo.fromJson(Map<String, dynamic> json) =>
      _$ExtraInfoFromJson(json);
}
