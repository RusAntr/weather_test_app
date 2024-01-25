import 'package:bloc/bloc.dart';
import 'package:weather_test_app/core/resources/data_state.dart';
import 'package:weather_test_app/features/domain/repository/weather_repository.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_state.dart';

/// Handles weather data processing and presents it to ui
class WeatherBloc extends Bloc<WeatherEvent, WeatherBlocState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(const WeatherLoading()) {
    on<GetWeatherDataEvent>(onGetWeatherData);
  }

  /// Calls repository -> api for data
  void onGetWeatherData(
    GetWeatherDataEvent event,
    Emitter<WeatherBlocState> emit,
  ) async {
    final dataState =
        await weatherRepository.getWeatherData(lat: event.lat, lon: event.lon);
    if (dataState is DataSuccess && dataState.data != null) {
      emit(
        WeatherLoadedSuccessfully(dataState.data!),
      );
    }

    /// If call was unsuccessful
    if (dataState is DataFailed) {
      emit(
        WeatherLoadingError(dataState.error!),
      );
    }
  }
}
