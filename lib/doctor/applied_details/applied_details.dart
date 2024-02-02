import 'package:flutter/material.dart';
import 'package:mednet/network/local/cache_helper.dart';

class AppliedDetails extends StatelessWidget {
  const AppliedDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Maintenance place',style: TextStyle(color: Colors.black),),
              Text(CacheHelper.getData(key: 'maintenancePlace'),style: TextStyle(color: Colors.white),),
              SizedBox(height: 15,),
              Text('Maintenance date',style: TextStyle(color: Colors.black),),
              Text(CacheHelper.getData(key: 'maintenanceDate'),style: TextStyle(color: Colors.white),),
              SizedBox(height: 15,),
              Text('Maintenance time',style: TextStyle(color: Colors.black),),
              Text(CacheHelper.getData(key: 'maintenanceTimeName'),style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
