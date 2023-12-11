import 'package:flutter/cupertino.dart';

// class Responsive {
// static double screenHeight;
// static double screenWidth;
// static double textMultiplier = 0;
//   void init(BoxConstraints constraints, Orientation orientation){
//   screenHeight = constraints.maxHeight;
//   screenWidth = constraints.maxWidth;
//   //final mult = screenHeight*screenWidth;
//   textMultiplier =  screenHeight / screenWidth;
//   print(screenHeight); print(screenWidth); print(textMultiplier);
//   //print(mult);
// }
// }

class Responsive {
  static double? screenHeight;
  static double? screenWidth;
  static double textMultiplier = 0;

  void init(BoxConstraints constraints, Orientation orientation) {
    screenHeight = constraints.maxHeight;
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
    } else {
      screenWidth = constraints.maxWidth * 0.8;
    }
    textMultiplier = screenHeight! / screenWidth!;
    //print(mult);
  }
}