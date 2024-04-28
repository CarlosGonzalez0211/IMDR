import 'package:firebase_database/firebase_database.dart';

class LocationService {
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref().child('network').child('locations');

  Future<List<Map<String, dynamic>>> getMedicLocations() async {
    try {
      DatabaseEvent event = await _databaseReference.once();
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.exists) {
        Map<dynamic, dynamic>? locationsData = snapshot.value as Map<dynamic, dynamic>?;
        if (locationsData != null) {
          List<Map<String, dynamic>> locations = [];

          locationsData.forEach((key, value) {
            if (value is Map<dynamic, dynamic>) {
              Map<String, dynamic> location = Map<String, dynamic>.from(value);
              location['id'] = key;
              locations.add(location);
            }
          });

          return locations;
        }
      }
      return [];
    } catch (error) {
      print('Error retrieving medic locations: $error');
      return [];
    }
  }

  void populateDatabase() {
    final medicLocations = [
      {
        'latitude': 37.7749,
        'longitude': -122.4194,
        'name': 'Medic 1',
      },
      {
        'latitude': 37.7858,
        'longitude': -122.4364,
        'name': 'Medic 2',
      },
      {
        'latitude': 37.7963,
        'longitude': -122.4574,
        'name': 'Medic 3',
      },
      // add more medic locations as needed
    ];

    for (var medicLocation in medicLocations) {
      _databaseReference.push().set(medicLocation);
    }
  }
}