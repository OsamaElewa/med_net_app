import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Center name:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text(CacheHelper.getData(key: 'compCenterName'),style: TextStyle(color: Colors.white),),
                    SizedBox(height: 20,),
                    Text('Device name:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text(CacheHelper.getData(key: 'compDeviceName'),style: TextStyle(color: Colors.white),),
                    SizedBox(height: 20,),
                    Text('Manufacture company:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text(CacheHelper.getData(key: 'compManufactureCompany'),style: TextStyle(color: Colors.white),),
                    SizedBox(height: 20,),
                    Text('Model number:',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text(CacheHelper.getData(key: 'compModelNumber'),style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendInitialReport(),));
                }, child: Text('Send initial report',style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height: 15,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendFinalReport(),));
                }, child: Text('Send final report',style: TextStyle(color: Colors.white),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
