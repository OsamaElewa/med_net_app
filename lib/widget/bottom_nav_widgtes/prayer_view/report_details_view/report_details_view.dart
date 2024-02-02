import 'package:flutter/material.dart';

import '../final_report_details_view/final_report_details_view.dart';
import '../initial_report_details_view/initial_report_details_view.dart';

class ReportDetailsView extends StatelessWidget {
  const ReportDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InitialReportDetailsView(),));
            }, child: Text('initial report',style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FinalReportDetailsView(),));
            }, child: Text('final report',style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }
}
