import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mednet/Registration/registration_screen.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import '../../network/local/cache_helper.dart';

void showCustomDialog(BuildContext context) {
  Navigator.of(context).push(_customPageRoute(AnimatedDialog(), context));
}

PageRouteBuilder _customPageRoute(Widget page, BuildContext context) {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) => page,
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var offsetAnimation = animation.drive(tween);

      return Stack(
        children: [
          // Background overlay
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: black.withOpacity(0.54),
              ),
            ),
          ),
          // Actual dialog
          Positioned.fill(
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

class AnimatedDialog extends StatelessWidget {
  const AnimatedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: screenHeight(context, .6),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Go out',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: grey,
                ),
              ),
              Text(
                'Confirm logout',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: grey,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset('assets/images/register.png'),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        CacheHelper.removeData(key: 'firstNameLocal');
                        CacheHelper.removeData(key: 'lastNameLocal');
                        CacheHelper.removeData(key: 'emailAddressLocal');
                        navigateAndFinish(const RegistrationScreen(), context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          child: Center(
                            child: Text(
                              'Go out',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
