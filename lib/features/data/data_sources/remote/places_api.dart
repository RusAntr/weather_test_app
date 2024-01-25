import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_test_app/core/app_consts.dart';
import 'package:weather_test_app/features/data/models/models.dart';

part 'places_api.g.dart';

/// Geocoding API service
@RestApi(baseUrl: 'https://api.openweathermap.org/')
abstract interface class PlacesApi {
  factory PlacesApi(Dio dio) = _PlacesApi;

  /// Retrieves a list of [Place] objects
  /// place name is required
  @GET('/geo/1.0/direct?q={name}&limit=5&appid=${AppConsts.APIKEY}')
  Future<HttpResponse<List<Place>>> getPlacesCoordsByName(
      @Path('name') String name);
}
