import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_test_app/features/presentation/bloc/weather_bloc/weather_state.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  DateFormat timeFormat = DateFormat('HH:mm');

  /// Shows error snackbar
  void _showSnack(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ошибка-$error'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Назад', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: BlocListener<WeatherBloc, WeatherBlocState>(
        listener: (context, state) {
          if (state is WeatherLoadingError) {
            _showSnack(state.error?.message ?? 'неизвестно какая');
          }
        },
        child: BlocBuilder<WeatherBloc, WeatherBlocState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadingError) {
              return const Center(
                child: Text('Ошибка получения данных :c'),
              );
            }
            if (state is WeatherLoadedSuccessfully) {
              final weather = state.weatherEntity;
              return ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15.0,
                ),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Город - ${weather?.name ?? ''}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Страна - ${weather?.extraInfo?.country ?? ''}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Table(
                    children: [
                      TableRow(
                        children: [
                          const Text('Температура'),
                          Text('${weather?.mainInfo?.temp.toString() ?? ''}°С'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Ощущается как'),
                          Text(
                              '${weather?.mainInfo?.feelsLike.toString() ?? ''}°С'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Мин.температура'),
                          Text(
                              '${weather?.mainInfo?.tempMin.toString() ?? ''}°С'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Макс. температура'),
                          Text('${weather?.mainInfo?.tempMax ?? ''}°С'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Скорость ветра'),
                          Text('${weather?.wind?.speed} м/c'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Направление ветра'),
                          Text('${weather?.wind?.deg}'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Давление'),
                          Text('${weather?.mainInfo?.pressure} hPa'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Влажность'),
                          Text('${weather?.mainInfo?.humidity}%'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Описание'),
                          Text('${weather?.weatherState?[0].description}'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Уровень моря'),
                          Text(weather?.mainInfo?.seaLevel == null
                              ? 'неизвестно'
                              : weather!.mainInfo!.seaLevel.toString()),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Облачность'),
                          Text('${weather?.clouds?.all}%'),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Видимость'),
                          Text(weather?.visibility?.toString() ?? ''),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Широта'),
                          Text(weather?.coordinates?.lat.toString() ?? ''),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Долгота'),
                          Text(weather?.coordinates?.lon.toString() ?? ''),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Время'),
                          Text(DateTime.fromMillisecondsSinceEpoch(
                                  (((weather?.dt ?? 0) +
                                          (weather?.timezone ?? 0)) as int) *
                                      1000)
                              .toString()),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Рассвет'),
                          Text(timeFormat.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  (((weather?.extraInfo?.sunrise ?? 0) +
                                          (weather?.timezone ?? 0)) as int) *
                                      1000))),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text('Закат'),
                          Text(timeFormat
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  (((weather?.extraInfo?.sunset ?? 0) +
                                          (weather?.timezone ?? 0)) as int) *
                                      1000))
                              .toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
