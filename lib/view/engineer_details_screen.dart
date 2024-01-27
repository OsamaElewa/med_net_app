import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/submit_information/submit_information.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../constants/colors.dart';
import 'map/leaflet_map_widget.dart';

class EngineerDetailsScreen extends StatelessWidget {
  final Engineer engineer;
  final double distance;

  const EngineerDetailsScreen({
    Key? key,
    required this.engineer,
    required this.distance,
  }) : super(key: key);

  String _formatDistance(double distance) {
    if (distance < 1) {
      return '${(distance * 1000).toStringAsFixed(2)} meters';
    } else {
      return '${distance.toStringAsFixed(2)} km';
    }
  }

  String _calculateTravelTime(double distance, double speed) {
    double travelTimeInHours = distance / speed;
    return travelTimeInHours.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String travelTime =
        _calculateTravelTime(distance, engineer.averageCarSpeed);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(engineer.image),
            ),
            const SizedBox(height: 20.0),
            Text(
              engineer.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              engineer.phoneNumber,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20.0),
            const Text('Job Title :',style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),),
            const SizedBox(height: 20.0),
            Text(
              engineer.jobName,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Distance:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              _formatDistance(distance),
              style: const TextStyle(fontSize: 24, color: Colors.blue),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Estimated Travel Time:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '$travelTime hours',
              style: const TextStyle(fontSize: 24, color: Colors.green),
            ),
            const SizedBox(
              height: 25,
            ),
            CacheHelper.getData(key: 'jobId') == 0
                ? Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SubmitInformation(),
                              ));
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.black),
                        )),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
