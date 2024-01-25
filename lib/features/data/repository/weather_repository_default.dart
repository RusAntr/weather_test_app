import 'dart:io';

import 'package:dio/dio.dart';
import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/data/data_sources/remote/weather_api.dart';
import 'package:weather_test_app/features/data/models/models.dart';
import 'package:weather_test_app/features/domain/repository/weather_repository.dart';

/// Default of implementation of [WeatherRepository]
class WeatherRepositoryDefault implements WeatherRepository {
  /// API service
  final WeatherApi _weatherApi;
  WeatherRepositoryDefault(this._weatherApi);

  /// Returns [DataState] of either [Weather] object or [DioException]
  @override
  Future<DataState<Weather>> getWeatherData({
    required num lat,
    required num lon,
  }) async {
    try {
      final response = await _weatherApi.getWeatherData(lat: lat, lon: lon);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: response.response.requestOptions,
            response: response.response,
            error: response.response.statusMessage,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
