import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';

/// Repository interface
/// repo <- api
abstract interface class PlacesRepository {
  /// Retrieves places data
  Future<DataState<List<PlaceEntity>>> getPlacesData(String name);
}
