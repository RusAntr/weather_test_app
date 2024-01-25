import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_test_app/features/data/data_sources/remote/places_api.dart';
import 'package:weather_test_app/features/data/data_sources/remote/weather_api.dart';
import 'package:weather_test_app/features/data/repository/places_repository_default.dart';
import 'package:weather_test_app/features/data/repository/weather_repository_default.dart';
import 'package:weather_test_app/features/domain/repository/places_repository.dart';
import 'package:weather_test_app/features/domain/repository/weather_repository.dart';
import 'package:weather_test_app/features/presentation/bloc/places_bloc/places_bloc.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_bloc.dart';

final serviceLocator = GetIt.instance;
Future<void> initilizeDependencies() async {
  /// Dio
  serviceLocator.registerSingleton<Dio>(Dio());

  /// API
  serviceLocator.registerSingleton<PlacesApi>(PlacesApi(serviceLocator<Dio>()));
  serviceLocator
      .registerSingleton<WeatherApi>(WeatherApi(serviceLocator<Dio>()));

  /// Repositories
  serviceLocator.registerSingleton<PlacesRepository>(
      PlacesRepositoryDefault(serviceLocator<PlacesApi>()));
  serviceLocator.registerSingleton<WeatherRepository>(
      WeatherRepositoryDefault(serviceLocator<WeatherApi>()));

  /// BLoCs
  serviceLocator
      .registerFactory<PlacesBloc>(() => PlacesBloc(serviceLocator()));
  serviceLocator
      .registerFactory<WeatherBloc>(() => WeatherBloc(serviceLocator()));
}
