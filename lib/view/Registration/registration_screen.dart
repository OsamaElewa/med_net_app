import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../logic/registration_bloc/registration_cubit.dart';
import '../../logic/registration_bloc/registration_states.dart';
import '../../widget/registration/guide.dart';
import '../../widget/registration/toggle_button.dart';
import '../../widget/registration/user.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool Male = false;
  bool Female = false;
  bool value = false;

  @override
  void initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegistrationCubit, RegistrationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegistrationCubit.get(context);
          return Container(
            color: backGroundColor,
            child: SafeArea(
              child: Stack(
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
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Registration',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const ToggleButton(maleAlignment),
                          cubit.isUser
                              ? const UserRegistrationWidget()
                              : const GuideRegistrationWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
