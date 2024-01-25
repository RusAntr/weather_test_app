import 'package:bloc/bloc.dart';
import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';
import 'package:weather_test_app/features/domain/repository/places_repository.dart';
import 'package:weather_test_app/features/presentation/bloc/places_bloc/places_event.dart';
import 'package:weather_test_app/features/presentation/bloc/places_bloc/places_state.dart';

/// Handles places data processing and presents it to ui
class PlacesBloc extends Bloc<PlacesEvent, PlacesBlocState> {
  final PlacesRepository placesRepository;
  PlacesBloc(this.placesRepository) : super(const PlacesLoading()) {
    const PlacesLoading();
  }

  /// Calls repository -> api for data
  Future<List<PlaceEntity>> onGetPlacesData(String name) async {
    final dataState = await placesRepository.getPlacesData(name);
    if (dataState is DataSuccess && dataState.data != null) {}

    /// If call was unsuccessful
    if (dataState is DataFailed) {
      throw Exception(dataState.error?.message);
    }
    return dataState.data!;
  }
}
