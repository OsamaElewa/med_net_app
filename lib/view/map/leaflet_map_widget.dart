import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../engineer_details_screen.dart';

class MapScreen extends StatefulWidget {
  final String searchedPlace;

  const MapScreen({
    Key? key,
    required this.searchedPlace,
  }) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState(searchedPlace);
}

class MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  late LatLng _centerLatLng = const LatLng(0, 0);
  final String searchedPlace;

  MapScreenState(this.searchedPlace);

  @override
  void initState() {
    super.initState();
    _updateMapCenter();
  }

  Future<void> _updateMapCenter() async {
    try {
      List<Location> locations =
      await locationFromAddress(widget.searchedPlace);
      if (locations.isNotEmpty) {
        final Location firstLocation = locations.first;
        setState(() {
          _centerLatLng =
              LatLng(firstLocation.latitude, firstLocation.longitude);
        });
        _mapController.move(_centerLatLng, 13.0);
      } else {
        debugPrint('No locations found for the searched place');
      }
    } catch (e) {
      debugPrint('Error geocoding the searched place: $e');
    }
  }

  List<Engineer> engineers = [
    Engineer(
      name: 'Nermeen esam elden',
      phoneNumber: '01111944950',
      image: 'assets/images/eng1.png', // Make sure to adjust the path
      averageCarSpeed: 60.0,
      jobName: 'maintenance of dental units',
    ),
    Engineer(
      name: 'alaa mahmoud abd elrheem',
      phoneNumber: '01155009376',
      image: 'assets/images/eng2.png', // Make sure to adjust the path
      averageCarSpeed: 55.0,
      jobName: 'maintenance',
    ),
    Engineer(
      name: 'basem hessen mohamed',
      phoneNumber: '01029801653',
      image: 'assets/images/eng3.png', // Make sure to adjust the path
      averageCarSpeed: 55.0,
      jobName: 'maintenance of dental units',
    ),
    Engineer(
      name: 'alaa mahmoud abd elrheem',
      phoneNumber: '01223988754',
      image: 'assets/images/eng4.png', // Make sure to adjust the path
      averageCarSpeed: 55.0,
      jobName: 'shock device maintenance',
    ),
    // Add more engineers as needed
  ];
  void _addPlaceToPlan(LatLng location) {
    dynamic latitude = location.latitude;
    dynamic longitude = location.longitude;

    debugPrint('name: $searchedPlace');
    debugPrint('lat: $latitude');
    debugPrint('lon: $longitude');
  }

// Inside MapScreenState class
  List<Marker> _generateEngineerMarkers(List<Engineer> engineers) {
    List<Marker> markers = [];

    // Calculate a smaller random offset to make engineers appear closer to the red marker
    final double offsetLat = Random().nextDouble() * 0.002;
    final double offsetLng = Random().nextDouble() * 0.002;

    for (Engineer engineer in engineers) {
      final double randomLat =
          _centerLatLng.latitude + offsetLat * (Random().nextBool() ? 1 : -1);
      final double randomLng =
          _centerLatLng.longitude + offsetLng * (Random().nextBool() ? 1 : -1);

      final Marker marker = Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(randomLat, randomLng),
        child: GestureDetector(
          child: const Icon(Icons.location_on, color: Colors.blue),
          onTap: () {
            double distance = _calculateDistance(
                _centerLatLng.latitude, _centerLatLng.longitude, randomLat, randomLng);
            _navigateToEngineerDetailsScreen(engineer, distance);
          },
        ),
      );

      markers.add(marker);
    }

    return markers;
  }

  void _navigateToEngineerDetailsScreen(Engineer engineer, double distance) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EngineerDetailsScreen(
          engineer: engineer,
          distance: distance,
        ),
      ),
    );
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371.0;
    double dLat = radianToDeg(lat2 - lat1);
    double dLon = radianToDeg(lon2 - lon1);

    double a = pow(sin(dLat / 2), 2) +
        cos(radianToDeg(lat1)) * cos(radianToDeg(lat2)) * pow(sin(dLon / 2), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _centerLatLng,
          zoom: 13.0,
          minZoom: 5.0,
          maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: _centerLatLng,
              child: const Icon(Icons.location_on, color: Colors.red),
            ),
            ..._generateEngineerMarkers(engineers), // Pass the list of engineers
          ]),
        ],
      ),
    );
  }
}
class Engineer {
  final String name;
  final String jobName;
  final String phoneNumber;
  final String image;
  final double averageCarSpeed;

  Engineer({
    required this.name,
    required this.jobName,
    required this.phoneNumber,
    required this.image,
    required this.averageCarSpeed,
  });
}
