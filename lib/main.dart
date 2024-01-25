import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/di_container.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_test_app/features/presentation/screens/enter_city_screen.dart';

import 'features/presentation/bloc/places_bloc/places_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilizeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlacesBloc>(
          create: (context) => serviceLocator(),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => serviceLocator(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather Test App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const EnterCityScreen(),
      ),
    );
  }
}
