import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/widget/bottom_nav_widgtes/prayer_view/report_details_view/report_details_view.dart';


class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'engInitialReport') != null ? Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 35,),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportDetailsView(),)),
            child: Container(
              padding: const EdgeInsets.all(7),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('report from engineer:',style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 10,),
                  Text('click to see details',
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
    ) : Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('when the engineer send the report it will appear here!',style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
