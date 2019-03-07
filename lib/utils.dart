import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color colorLogo1 = HexColor("#FFC515");
Future<int> countCompletedTalents(List<String> keys) async {
  int completed = 0;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  for (int i = 0; i < keys.length; i++) {
    if (await prefs.getBool(keys[i]) != null) {
      if (prefs.getBool(keys[i])) {
        completed++;
      }
    }
  }
  return completed;
}
