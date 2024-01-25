import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

/// Repository interface
/// repo <- api
abstract interface class WeatherRepository {
  /// Retrieves weather data
  Future<DataState<WeatherEntity>> getWeatherData({
    required num lat,
    required num lon,
  });
}
