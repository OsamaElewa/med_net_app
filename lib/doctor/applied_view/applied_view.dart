import 'package:flutter/material.dart';
import 'package:mednet/doctor/applied_details/applied_details.dart';
import 'package:mednet/network/local/cache_helper.dart';

class AppliedView extends StatelessWidget {
  const AppliedView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'acceptRequest') != null? SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const AppliedDetails(),));
              },
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
                    const Text('your report is accepted :',style: TextStyle(color: Colors.black),),
                    const SizedBox(height: 10,),
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
