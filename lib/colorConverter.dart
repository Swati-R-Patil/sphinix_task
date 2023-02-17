import 'package:flutter/cupertino.dart';

class ColorConverter {
  static Map<int, Color> color = {
    50: Color.fromRGBO(31, 137, 184, .1),
    100: Color.fromRGBO(31, 137, 184, .2),
    200: Color.fromRGBO(31, 137, 184, .3),
    300: Color.fromRGBO(5, 162, 222, 0.4),
    400: Color.fromRGBO(31, 137, 184, .5),
    500: Color.fromRGBO(12, 152, 213, 0.6),
    600: Color.fromRGBO(8, 115, 173, 0.7019607843137254),
    700: Color.fromRGBO(8, 87, 120, 0.8),
    800: Color.fromRGBO(31, 137, 184, .9),
    900: Color.fromRGBO(17, 115, 158, 1.0),
  };

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

}