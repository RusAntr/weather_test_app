import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_test_app/core/app_consts.dart';
import 'package:weather_test_app/features/data/models/models.dart';

part 'weather_api.g.dart';

/// API service
@RestApi(baseUrl: 'https://api.openweathermap.org/')
abstract interface class WeatherApi {
  factory WeatherApi(Dio dio) = _WeatherApi;

  /// Retrieves a [Weather] object
  /// lat and lon of a place are required
  @GET(
      'data/2.5/weather?lat={lat}&lon={lon}&units=metric&lang=ru&appid=${AppConsts.APIKEY}')
  Future<HttpResponse<Weather>> getWeatherData(
      {@Path('lat') required num lat, @Path('lon') required num lon});
}
