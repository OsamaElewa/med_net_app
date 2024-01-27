import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/report_details_view/report_details_view.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'jobId') == 1 ? Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Text('Center Name :',style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 10,),
                  Text(
                    CacheHelper.getData(key: 'centerName'),
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
    ) : const Center(
      child: Text('this page is for the service provider!',style: TextStyle(color: Colors.amber,fontSize: 18,fontWeight: FontWeight.bold),),
    );
  }
}
