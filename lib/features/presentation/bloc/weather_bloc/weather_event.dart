/// Describes events regarding handling and processing weather data
abstract class WeatherEvent {
  const WeatherEvent();
}

/// Making a call to repostory for weather data event
class GetWeatherDataEvent extends WeatherEvent {
  final num lat;
  final num lon;
  const GetWeatherDataEvent({required this.lat, required this.lon});
}
