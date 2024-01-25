import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

part 'main_info.g.dart';

/// MainInfo model for json serialization/deserialization of data recieved over network
/// Extends [MainInfo] <- Read more about its attributes there
@JsonSerializable(fieldRename: FieldRename.snake)
class MainInfo extends MainInfoEntity {
  const MainInfo({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,
  }) : super(
          temp: temp,
          feelsLike: feelsLike,
          tempMax: tempMax,
          tempMin: tempMin,
          pressure: pressure,
          humidity: humidity,
          seaLevel: seaLevel,
          grndLevel: grndLevel,
        );

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);
}
