

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../services/location_service.dart'; // import the LocationService class

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  final LocationService _locationService = LocationService();
  final Set<Marker> _markers = {};
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    final medicLocations = await _locationService.getMedicLocations();
    setState(() {
      for (var location in medicLocations) {
        _markers.add(Marker(
          markerId: MarkerId(location['id']),
          position: LatLng(location['latitude'], location['longitude']),
          infoWindow: InfoWindow(title: location['name']),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find a Medic Near you!"),
      ),
      body: Stack(
        children: [
          _currentPosition == null
              ? const Center(child: Text('Loading...'))
              : GoogleMap(
            initialCameraPosition:
            CameraPosition(target: _currentPosition!, zoom: 14),
            onMapCreated: (GoogleMapController controller) {
            },
            markers: {
              Marker(
                markerId: const MarkerId("_sourceLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentPosition!,
              ),
              const Marker(
                markerId: MarkerId("_destinationLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(37.755634, -122.403748),
              ),
              const Marker(
                markerId: MarkerId("_destinationLocation1"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(37.783085, -122.511177),
              ),
              const Marker(
                markerId: MarkerId("_destinationLocation2"),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(37.7563, -122.403748),
              ),
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPlaceItem(
                    'https://lh5.googleusercontent.com/p/AF1QipPRDp4ld_u_jEBcRo4Pbrs0tVSWzd7yWAwQ2wI2=w532-h240-k-no',
                    '1001 Potrero Ave',
                    '(123) 456-7890',
                  ),
                  _buildPlaceItem(
                    'https://lh5.googleusercontent.com/p/AF1QipOab1TEk4mq-ypj3NeRBrJsgYVjZHXvO5L-HbNi=w408-h306-k-no',
                    '900 Hyde St',
                    '+1 (628) 206 8000',
                  ),
                  _buildPlaceItem(
                    'https://lh5.googleusercontent.com/p/AF1QipM2QqJOdavPn-91LNq9oXuiwHXIttA_nHneGzOK=w426-h240-k-no',
                    '505 Parnassus Ave',
                    '+1 (415) 476 1000',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceItem(String imageUrl, String address, String phone) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  phone,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }
}