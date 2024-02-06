import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/doctor/bill_details/rating_bottom_sheet.dart';
import 'package:mednet/doctor/rate_view/rate_view.dart';
import 'package:mednet/network/local/cache_helper.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Container(
            padding: EdgeInsets.all(10.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Updates:',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  CacheHelper.getData(key: 'compUpdates'),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Final Cost:',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  CacheHelper.getData(key: 'compFinalCost'),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Phone number:',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  CacheHelper.getData(key: 'compPhoneNumber'),
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'please send the money on this number',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      'to rate the service please',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return RatingBottomSheet();
                          },);
                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
