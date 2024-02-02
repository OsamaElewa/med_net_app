import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mednet/doctor/device_form/device_from.dart';

class SendReport extends StatelessWidget {
  const SendReport({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeviceForm(),)),
                    child: Text('send request',style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        )
    );
  }
}
