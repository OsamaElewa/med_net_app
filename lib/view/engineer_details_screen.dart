import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.all(16.0.sp),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0.r,
                backgroundImage: AssetImage(engineer.image),
              ),
              SizedBox(height: 20.0.h),
              Text(
                engineer.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0.h),
              Text(
                engineer.phoneNumber,
                style:  TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
              SizedBox(height: 20.0.h),
              Text('Job Title :',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 20.0.h),
              Text(
                engineer.jobName,
                style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
              SizedBox(height: 20.0.h),
              Text(
                'Distance:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _formatDistance(distance),
                style:  TextStyle(fontSize: 24.sp, color: Colors.blue),
              ),
               SizedBox(height: 20.0.h),
               Text(
                'Estimated Travel Time:',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$travelTime hours',
                style: TextStyle(fontSize: 24.sp, color: Colors.green),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                      height: 50.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15.r),
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
