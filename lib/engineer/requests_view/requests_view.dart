import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/engineer/job_request_detail/job_request_detail.dart';
import 'package:mednet/network/local/cache_helper.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'reportToEng') !=null? SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => JobRequestDetails(),)),
              child: Container(
                height: 120.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('job request:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text(CacheHelper.getData(key: 'compCenterName'),style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ) : Center(child: Text('the request for job will appear here',style: TextStyle(color: Colors.white),),);
  }
}
