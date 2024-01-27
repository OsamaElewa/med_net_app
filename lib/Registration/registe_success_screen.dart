import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/custom_button.dart';
import '../constants/transitions.dart';
import '../view/bottom_nav/bottom_nav_screen.dart';

class RegisterSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: backGroundColor,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/images/bc.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: 10,
                  bottom: 10,
                  right: 20,
                  left: 20,
                  child: AnimationLimiter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Text(
                            'Registration successful',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset('assets/images/register.png'),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: CustomButton(
                    width: double.infinity,
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: AppLayout(),
                        ),
                      );
                    },
                    title: 'To Main',
                    txtColor: grey,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
