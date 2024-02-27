import 'package:flutter/material.dart';

class ResponsiveLayout {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double widthMultiplier(BuildContext context, double factor) {
    return (screenWidth(context) * factor) / 100;
  }

  static double heightMultiplier(BuildContext context, double factor) {
    return (screenHeight(context) * factor) / 100;
  }
}
