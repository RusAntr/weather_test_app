/// Describes events regarding handling and processing places data
abstract class PlacesEvent {
  const PlacesEvent();
}

/// Making a call to repostory for places data
class GetPlacesDataEvent extends PlacesEvent {
  final String name;
  const GetPlacesDataEvent({required this.name});
}
