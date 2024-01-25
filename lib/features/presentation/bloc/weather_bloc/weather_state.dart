import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

abstract class WeatherBlocState extends Equatable {
  /// Weather entity
  final WeatherEntity? weatherEntity;

  /// Error
  final DioException? error;

  const WeatherBlocState({
    this.weatherEntity,
    this.error,
  });

  @override
  List<Object?> get props => [error];
}

/// Default loading state
class WeatherLoading extends WeatherBlocState {
  const WeatherLoading();
}

/// Successful state of loaded booking data returns [WeatherEntity] object
class WeatherLoadedSuccessfully extends WeatherBlocState {
  const WeatherLoadedSuccessfully(WeatherEntity booking)
      : super(weatherEntity: booking);
}

/// Failed attempt at loading bookind data returns [DioException]
class WeatherLoadingError extends WeatherBlocState {
  const WeatherLoadingError(DioException error) : super(error: error);
}
