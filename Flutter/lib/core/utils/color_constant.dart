import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color purple100 = fromHex('#e5b8f4');

  static Color black900B2 = fromHex('#b2000000');

  static Color purple100D2 = fromHex('#d2e5b8f4');

  static Color whiteA700D8 = fromHex('#d8ffffff');

  static Color red800 = fromHex('#c82337');

  static Color purple10001 = fromHex('#e8a6ff');

  static Color purple10000 = fromHex('#00e5b8f4');

  static Color purple10066 = fromHex('#66e5b8f4');

  static Color black9003f = fromHex('#3f000000');

  static Color black9001e = fromHex('#1e000000');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color purple10062 = fromHex('#62e5b8f4');

  static Color lightGreen700 = fromHex('#779042');

  static Color gray50001 = fromHex('#a0a0a0');

  static Color purple40001 = fromHex('#b73de0');

  static Color purple400 = fromHex('#b83ee0');

  static Color gray600 = fromHex('#6c757d');

  static Color black9004c = fromHex('#4c000000');

  static Color gray400 = fromHex('#bebdbd');

  static Color gray500 = fromHex('#a3a3a3');

  static Color blueGray400 = fromHex('#8c8b8b');

  static Color gray800 = fromHex('#463f3a');

  static Color gray900 = fromHex('#2d033b');

  static Color amber700 = fromHex('#f4a500');

  static Color black90033 = fromHex('#33000000');

  static Color black90072 = fromHex('#72000000');

  static Color bluegray400 = fromHex('#888888');

  static Color whiteA70001 = fromHex('#fffdfd');

  static Color gray40066 = fromHex('#66bebebe');

  static Color amber70001 = fromHex('#f4a400');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90059 = fromHex('#59000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
