import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class LeafletMapWidget extends StatefulWidget {
  final LocationData? currentLocation;

  const LeafletMapWidget({
    Key? key,
    required this.currentLocation,
  }) : super(key: key);

  @override
  _LeafletMapWidgetState createState() => _LeafletMapWidgetState();
}

class _LeafletMapWidgetState extends State<LeafletMapWidget> {
  final MapController _mapController = MapController();
  late LatLng _centerLatLng = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _updateMapCenter();
  }

  Future<void> _updateMapCenter() async {
    if (widget.currentLocation != null) {
      final LocationData currentLocation = widget.currentLocation!;
      _centerLatLng = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      _mapController.move(_centerLatLng, 13.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: _centerLatLng,
        zoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 30.0,
              height: 30.0,
              point: _centerLatLng,
              child: Icon(Icons.location_on, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
