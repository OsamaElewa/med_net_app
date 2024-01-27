import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onTap;
  final Color? color;
  final Color txtColor;
  final String title;
  final double radius;
  final FontWeight weight;
  final double elevation;
  final Color? gradient1;
  final Color? gradient2;

  const CustomButton({
    Key? key,
    required this.width,
    this.height = 42,
    required this.onTap,
    this.color,
    required this.title,
    this.radius = 8.0,
    this.txtColor = Colors.black,
    this.weight = FontWeight.w500,
    this.elevation = 0,
    this.gradient1,
    this.gradient2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      height: height,
      minWidth: width,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: () {
        onTap();
      },
      // Use BoxDecoration with a LinearGradient for the gradient
      color: null,
      child: Ink(
        width: width,
        decoration: BoxDecoration(
          gradient: color == null
              ? LinearGradient(
                  colors: [
                    gradient1 ?? const Color.fromRGBO(63, 81, 181, 1),
                    gradient2 ?? const Color.fromRGBO(63, 81, 181, 0.62),
                  ],
                  // Example gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : LinearGradient(
                  colors: [
                    color!,
                    color!,
                  ],
                  // Example gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style:
                  TextStyle(color: txtColor, fontWeight: weight, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonLoader extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomButtonLoader({
    Key? key,
    required this.width,
    required this.height,
    this.color = ColorResources.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height,
      minWidth: width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {},
      color: color,
      child: const SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
