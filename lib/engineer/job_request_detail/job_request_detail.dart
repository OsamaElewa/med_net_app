import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/engineer/send_final_report/send_final_report.dart';
import 'package:mednet/engineer/send_initial_report/send_initial_report.dart';
import 'package:mednet/network/local/cache_helper.dart';

class JobRequestDetails extends StatelessWidget {
  const JobRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SafeArea(
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Center name:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compCenterName'),style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20.h,),
                    Text('Device name:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compDeviceName'),style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20.h,),
                    Text('Description:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compDescriptionCompany'),style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20.h,),
                    Text('Center address:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compCenterAddress'),style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 20.h,),
                    Text('Available time:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compAvailableTime'),style: TextStyle(color: Colors.grey),),
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
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendInitialReport(),));
                }, child: Text('Send initial report',style: TextStyle(color: Colors.grey),)),
              ),
              SizedBox(height: 15.h,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendFinalReport(),));
                }, child: Text('Send final report',style: TextStyle(color: Colors.grey),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
