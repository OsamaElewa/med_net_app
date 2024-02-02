import 'package:flutter/material.dart';
import 'package:mednet/engineer/job_request_detail/job_request_detail.dart';
import 'package:mednet/network/local/cache_helper.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'reportToEng') !=null? SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => JobRequestDetails(),)),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('job request:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text(CacheHelper.getData(key: 'compCenterName'),style: TextStyle(color: Colors.white),),
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
