import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../location_service.dart';

class LocationManager {
  final LocationService _locationService;

  LocationManager(this._locationService);

  Future<List<LatLng>> getMedicLocations() async {
    final locations = await _locationService.getMedicLocations();
    return locations.map((location) {
      return LatLng(location['latitude'], location['longitude']);
    }).toList();
  }
}