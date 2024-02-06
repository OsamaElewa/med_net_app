import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mednet/constants/colors.dart';
import 'package:mednet/network/local/cache_helper.dart';

import 'doc_report_details.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/app_logo.png'),
                radius: 40.r,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mednet',
                    style: GoogleFonts.nanumMyeongjo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20.h),
          CacheHelper.getData(key: 'doctorRequest') != null? Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DocReportDetails(),));
                  },
                  child: Container(
                    padding: EdgeInsets.all(7.sp),
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Center Name :',style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10.h,),
                        Text(
                          CacheHelper.getData(key: 'doctorCenterName'),
                          style: TextStyle(color: Colors.grey,),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ) : Center(
            child: Column(
              children: [
                Text('No request yet!',style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
