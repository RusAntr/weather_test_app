import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable {
  /// Percent of cloudiness
  final num? all;
  const CloudsEntity({
    this.all,
  });

  @override
  List<Object?> get props => [all];

  CloudsEntity copyWith({
    num? all,
  }) {
    return CloudsEntity(
      all: all ?? this.all,
    );
  }
}
