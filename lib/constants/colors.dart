import 'package:flutter/material.dart';


class ColorResources {
  static const Color primary =   Color.fromRGBO(221, 36, 34, 1);
  static const Color secondary =   Color.fromRGBO(177, 29, 27, 1);
}

Color primaryColor = const Color.fromRGBO(221, 36, 34, 1);
Color secondaryColor = const Color.fromRGBO(177, 29, 27, 1);
Color tertiaryColor = const Color.fromRGBO(228, 80, 78, 1);
Color black = const Color.fromRGBO(27, 26, 34, 1);
Color white = const Color.fromRGBO(255, 255, 255, 1);
Color grey = const Color.fromRGBO(38, 35, 35, 1);
Color blue = const Color.fromRGBO(55, 77, 165, 1.0);
Color blue_dark_text = const Color.fromRGBO(23, 27, 72, 1);
Color grey_text = const Color.fromRGBO(117, 117, 117, 1);
Color grey_border = const Color.fromRGBO(226, 226, 226, 1);
Color blackGrey = const Color.fromRGBO(28, 28, 28, 0.76);
Color backGroundColor = const Color.fromRGBO(241, 241, 241, 1.0);
Color whiteGrey = const Color.fromRGBO(248, 249, 251, 1);
Color rateColor = const Color.fromRGBO(255, 189, 64, 1);

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

// LinearGradient gradient = LinearGradient(
//   // begin: Alignment.topLeft,
//   // end: Alignment.bottomRight,
//   colors: <Color>[
//     HexColor('#199A9E'),
//     HexColor('#299A9E'),
//     HexColor('#399A9E'),
//     HexColor('#499A9E'),
//     HexColor('#599A9E'),
//     HexColor('#699A9E'),
//   ],
// );
