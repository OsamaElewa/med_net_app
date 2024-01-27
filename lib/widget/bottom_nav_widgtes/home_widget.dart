import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:mednet/constants/colors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
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
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
