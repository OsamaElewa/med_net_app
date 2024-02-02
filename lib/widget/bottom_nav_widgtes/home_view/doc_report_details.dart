import 'package:flutter/material.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/send_final_report_to_doctor.dart';

import '../../../network/local/cache_helper.dart';

class DocReportDetails extends StatelessWidget {
  const DocReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Center Name : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CacheHelper.getData(key: 'doctorCenterName'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Device Name : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CacheHelper.getData(key: 'doctorDeviceName'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Manufacture Company : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CacheHelper.getData(key: 'doctorManufactureCompany'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Model Number : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CacheHelper.getData(key: 'doctorModelNumber'),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AcceptReport(),)),
                  child: Text('accept the report',style: TextStyle(color: Colors.white),)),
            ),
            const SizedBox(height: 15,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SendFinalReportToDoctor(),));
              }, child: Text('Final report',style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
