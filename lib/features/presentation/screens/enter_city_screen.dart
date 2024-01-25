import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:weather_test_app/di_container.dart';
import 'package:weather_test_app/features/domain/entities/entities.dart';
import 'package:weather_test_app/features/presentation/bloc/places_bloc/places_bloc.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_event.dart';
import 'package:weather_test_app/features/presentation/screens/weather_screen.dart';

class EnterCityScreen extends StatelessWidget {
  const EnterCityScreen({super.key});

  /// Makes a call to bloc to retrieve places data
  Future<List<PlaceEntity>> _onEnter(
      String cityName, BuildContext context) async {
    PlacesBloc bloc = context.read<PlacesBloc>();
    if (cityName.length > 3) {
      return await bloc.onGetPlacesData(cityName);
    }

    return [];
  }

  /// Redirects user to a weather screen when he selects a place
  /// Also adds a new event to weather bloc
  void _onSelected(PlaceEntity place, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<WeatherBloc>(
          create: (BuildContext context) => serviceLocator()
            ..add(
              GetWeatherDataEvent(
                lat: place.lat,
                lon: place.lon,
              ),
            ),
          child: const WeatherScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Введите название города',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            TypeAheadField<PlaceEntity>(
              suggestionsCallback: (search) => _onEnter(search, context),
              errorBuilder: (context, error) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ошибка! ${error.toString()}'),
                );
              },
              emptyBuilder: (context) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Город не найден'),
                );
              },
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'Например: Москва...',
                  ),
                );
              },
              itemBuilder: (context, city) {
                return ListTile(
                  title: Text(city.name),
                  subtitle: Text(city.country),
                );
              },
              onSelected: (city) => _onSelected(city, context),
            ),
          ],
        ),
      ),
    );
  }
}
