import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mednet/doctor/bill_details/bill_details.dart';
import 'package:mednet/network/local/cache_helper.dart';

class BillsView extends StatelessWidget {
  const BillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CacheHelper.getData(key: 'compSendFinalReport') != null? SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => BillDetails(),)),
              child: Container(
                padding: EdgeInsets.all(7),
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
                    Text('the bill :',style: TextStyle(color: Colors.black),),
                    Text('click to see the bill details',style: TextStyle(color: Colors.white),)
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
