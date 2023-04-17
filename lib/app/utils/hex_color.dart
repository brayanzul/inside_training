import 'package:flutter/material.dart';

int getColorFromHex(String hexString) {
  String hexColor = hexString.toUpperCase().replaceAll("#", "");
  if(hexColor.length == 6) hexColor = "FF" + hexColor;

  return int.parse(hexColor, radix: 16);
}

Color getColorFromString(String? hexString) {
  if(hexString != null) {
    return Color(
      getColorFromHex(hexString),
    );
  }
  return Colors.grey;
}

Color getCheckColor(bool status) {
  if (status) {
    return Color(
      getColorFromHex('#756BFF'),
    );
  }
  return Colors.grey;
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
