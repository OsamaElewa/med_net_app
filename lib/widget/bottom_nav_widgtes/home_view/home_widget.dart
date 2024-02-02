import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mednet/constants/colors.dart';
import 'package:mednet/network/local/cache_helper.dart';

import 'doc_report_details.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/app_logo.png'),
              radius: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mednet',
                  style: GoogleFonts.nanumMyeongjo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  'Save your time',
                  style: GoogleFonts.nanumMyeongjo(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: primaryColor.withOpacity(.7),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        CacheHelper.getData(key: 'doctorRequest') != null? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DocReportDetails(),));
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
                      const Text('Center Name :',style: TextStyle(color: Colors.black),),
                      const SizedBox(height: 10,),
                      Text(
                        CacheHelper.getData(key: 'doctorCenterName'),
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
        ) : Center(
          child: Column(
            children: [
              Text('No request yet!',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ],
    );
  }
}
