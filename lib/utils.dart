import 'package:flutter/material.dart';

class HooliColor extends Color {
  HooliColor(int value) : super(value);

  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFFF505050);
  static const Color light_gray = Color(0xFFFAFAFA);
  static const Color light_gray_2 = Color(0xFFDADADA);
  static const Color light_gray_3 = Color(0xFFD3D3D3);
  static const Color mid_gray = Color(0xffC7C6C6);
  static const Color gray = Color(0xFFA7A7A7);
  static const Color dark_gray = Color(0xFF686868);
  static const Color purple = Color(0xFF9373B1);
  static const Color yellow = Color(0xFFfcc020);
  static const Color pink = Color(0xffe56da1);
  static const Color light_blue = Color(0xff63c3d1);
  static const Color blue_hooli = Color(0xff5567ae);
  static const Color green_hooli = Color(0xff63d1a2);
  static const Color red_hooli = Color(0xffd44141);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}

class HooliGradient {
  static const white_to_blue =
      LinearGradient(colors: <Color>[Colors.white, HooliColor.blue_hooli]); 
       static const grey =
      LinearGradient(colors: <Color>[Color(0xFFDADADA),Color(0xFFDADADA)]);
      static const lightblue_to_blue =
      LinearGradient(colors: <Color>[HooliColor.light_blue, HooliColor.blue_hooli]);
      static const blue_to_lightblue =
      LinearGradient(colors: <Color>[HooliColor.blue_hooli, HooliColor.light_blue]);
  static const purple_to_pink =
      LinearGradient(colors: <Color>[HooliColor.purple, HooliColor.pink]);
  static const purple_to_blue =
      LinearGradient(colors: <Color>[HooliColor.purple, HooliColor.blue_hooli]);
  static const pink_to_lightblue =
      LinearGradient(colors: <Color>[HooliColor.pink, HooliColor.light_blue]);
  static const purple_to_lightblue =
      LinearGradient(colors: <Color>[HooliColor.purple, HooliColor.light_blue]);
  static const pink_to_yellow =
      LinearGradient(colors: <Color>[HooliColor.pink, HooliColor.yellow]);
      static const blue_to_purple =
      LinearGradient(colors: <Color>[HooliColor.blue_hooli, HooliColor.pink]);
  static final gradientPurpleToPink =
      LinearGradient(colors: <Color>[HooliColor.purple, HooliColor.pink]);

  static final gradientPurpleToLightBlue = LinearGradient(colors: <Color>[
    HooliColor.purple,
    HooliColor.light_blue,
  ]);  
  static final green_to_light_blue =
      LinearGradient(colors: <Color>[HooliColor.green_hooli, HooliColor.light_blue]);
}
