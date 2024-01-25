import 'package:equatable/equatable.dart';

class RainEntity extends Equatable {
  ///  Rain volume for the last 1 hour, mm
  final num? oneHour;
  const RainEntity({
    this.oneHour,
  });

  @override
  List<Object?> get props => [oneHour];

  RainEntity copyWith({
    num? oneHour,
  }) {
    return RainEntity(
      oneHour: oneHour ?? this.oneHour,
    );
  }
}
