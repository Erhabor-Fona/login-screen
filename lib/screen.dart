import 'package:flutter/material.dart';

class ScreenSize {
  static MediaQueryData _mediaQueryData;
  static double sWidth;
  static double sHeigh;
  static double defaul;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    sWidth = _mediaQueryData.size.width;
    sHeigh = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = ScreenSize.sHeigh;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = ScreenSize.sWidth ;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
