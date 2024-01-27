import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import '../../logic/registration_bloc/registration_cubit.dart';
import '../../logic/registration_bloc/registration_states.dart';

class ToggleButton extends StatefulWidget {
  final dynamic xAlignment;

  const ToggleButton(this.xAlignment, {super.key});

  @override
  ToggleButtonState createState() => ToggleButtonState();
}


const double buttonHeight = 60.0;
const double maleAlignment = -1;
const double femaleAlignment = 1;
const Color selectedColor = Colors.white;
const Color normalColor = Colors.black54;

class ToggleButtonState extends State<ToggleButton> {
  double? xAlignment;
  Color? maleColor;
  Color? femaleColor;

  @override
  void initState() {
    super.initState();
    xAlignment = widget.xAlignment;
    maleColor = xAlignment == maleAlignment ? selectedColor : normalColor;
    femaleColor = xAlignment == femaleAlignment ? selectedColor : normalColor;
    RegistrationCubit.get(context)
        .toggelUserType(xAlignment == maleAlignment ? true : false);
  }

  @override
  Widget build(BuildContext context) {
    double buttonWidth = screenWidth(context,.94);
    return BlocConsumer<RegistrationCubit, RegistrationStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegistrationCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(.2),
                  blurRadius: 17.0,
                  offset: Offset(0, 2),
                ),
              ],
              color: white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: Alignment(xAlignment!, 0),
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    width: buttonWidth * 0.5,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      xAlignment = maleAlignment;
                      maleColor = selectedColor;
                      femaleColor = normalColor;
                      cubit.toggelUserType(true);
                      print(cubit.isUser);
                    });
                  },
                  child: Align(
                    alignment: const Alignment(-1, 0),
                    child: Container(
                      width: buttonWidth * 0.5,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'User',
                        style: TextStyle(
                          color: maleColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      xAlignment = femaleAlignment;
                      femaleColor = selectedColor;
                      maleColor = normalColor;
                      cubit.toggelUserType(false);
                      print(cubit.isUser);
                    });
                  },
                  child: Align(
                    alignment: const Alignment(1, 0),
                    child: Container(
                      width: buttonWidth * 0.5,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        'guide',
                        style: TextStyle(
                          color: femaleColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
