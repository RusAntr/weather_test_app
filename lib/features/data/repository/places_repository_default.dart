import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/data/data_sources/remote/places_api.dart';
import 'package:weather_test_app/features/data/models/models.dart';
import 'package:weather_test_app/features/domain/repository/places_repository.dart';
import 'package:weather_test_app/features/domain/repository/weather_repository.dart';

/// Default of implementation of [WeatherRepository]
class PlacesRepositoryDefault implements PlacesRepository {
  /// API service
  final PlacesApi _placesApi;
  PlacesRepositoryDefault(this._placesApi);

  /// Returns [DataState] of either list of [Place] objects or [DioException]
  @override
  Future<DataState<List<Place>>> getPlacesData(String name) async {
    try {
      final response = await _placesApi.getPlacesCoordsByName(name);
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
