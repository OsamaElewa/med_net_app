import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/doctor/bill_details/bill_details.dart';
import 'package:mednet/network/local/cache_helper.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'compSendFinalReport') != null? SafeArea(
      child: Padding(
        padding: EdgeInsets.all(30.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BillDetails(),)),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('the bill :',style: TextStyle(color: Colors.black),),
                    Text('click to see the bill details',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ) :
        Center(
          child: Text('when the service completed the bill will appear here!',style: TextStyle(color: Colors.white),),
        );
  }
}
