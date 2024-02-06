import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/send_final_report_to_doctor.dart';

import '../../../network/local/cache_helper.dart';

class DocReportDetails extends StatelessWidget {
  const DocReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var selected=File(CacheHelper.getData(key: 'deviceImage'));
    File imageData=selected;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Health Care / organization Name : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorCenterName'),
                      style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Contact person name : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorContactPersonName'),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Phone number : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorPhoneNumber'),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.h,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Health care address: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorAddress'),
                      style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Device name: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorDeviceName'),
                      style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Brief Description : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      CacheHelper.getData(key: 'doctorDescription'),
                      style:  TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Image for device : ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image(
                        image: FileImage(imageData),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptReport(),)),
                    child: Text('accept the report',style: TextStyle(color: Colors.grey),)),
              ),
              SizedBox(height: 15.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendFinalReportToDoctor(),));
                }, child: Text('Final report',style: TextStyle(color: Colors.grey),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
