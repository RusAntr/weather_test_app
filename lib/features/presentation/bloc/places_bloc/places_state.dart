import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

abstract class PlacesBlocState extends Equatable {
  /// List of [PlaceEntity] entity
  final List<PlaceEntity>? placeEntities;

  /// Error
  final DioException? error;

  const PlacesBlocState({
    this.placeEntities,
    this.error,
  });

  @override
  List<Object?> get props => [error];
}

/// Default loading state
class PlacesLoading extends PlacesBlocState {
  const PlacesLoading();
}

/// Successful state of loaded places data returns a list of [PlaceEntity] objects
class PlacesLoadedSuccessfully extends PlacesBlocState {
  const PlacesLoadedSuccessfully(List<PlaceEntity> places)
      : super(placeEntities: places);
}

/// Failed attempt at loading places data returns [DioException]
class PlacesLoadingError extends PlacesBlocState {
  const PlacesLoadingError(DioException error) : super(error: error);
}
