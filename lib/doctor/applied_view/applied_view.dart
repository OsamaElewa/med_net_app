import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/doctor/applied_details/applied_details.dart';
import 'package:mednet/network/local/cache_helper.dart';

class AppliedView extends StatelessWidget {
  const AppliedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'acceptRequest') != null? SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 35.h,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const AppliedDetails(),));
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
                    const Text('your report is accepted :',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10.h,),
                    Text('click to view details',
                      style: TextStyle(color: Colors.white,),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ) : Center(
      child: Text('When you sending the device form the company confirmation will appear here !',style: TextStyle(color: Colors.white),),
    );
  }
}
