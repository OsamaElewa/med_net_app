import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:mednet/select_job_view/select_job_view.dart';
import 'package:mednet/view/bottom_nav/bottom_nav_screen.dart';
import '../../constants/components.dart';
import '../constants/transitions.dart';

class SplashScreen extends StatefulWidget {
  final bool isAuthenticated;
  final dynamic startWidget;

  const SplashScreen({
    Key? key,
    required this.isAuthenticated,
    this.startWidget,
  });

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          CustomPageRoute(child: const SelectJobView()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Image.asset(
              'assets/images/splash_bc.png',
              width: screenWidth(context, 1),
              height: screenHeight(context, 1),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
