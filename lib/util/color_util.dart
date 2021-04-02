import 'package:flutter/material.dart';

class ColorUtil {
  ColorUtil._();

  static const List<String> colorNames = [
    'red800',
    'orange800',
    'yellow800',
    'green500',
    'blue500',
    'indigo500',
    'purple500',
    'cyan500',
    'brown500',
    'pink500',
    'teal500'
  ];

  static Color getColorFromColorName(String colorName) {
    switch (colorName) {
      case 'red800':
        return Colors.red[800];
      case 'orange800':
        return Colors.orange[800];
      case 'yellow800':
        return Colors.yellow[800];
      case 'green500':
        return Colors.green;
      case 'blue500':
        return Colors.blue;
      case 'indigo500':
        return Colors.indigo;
      case 'purple500':
        return Colors.purple;
      case 'cyan500':
        return Colors.cyan;
      case 'brown500':
        return Colors.brown;
      case 'pink500':
        return Colors.pink;
      case 'teal500':
        return Colors.teal;
    }

    return Colors.red[500];
  }
}
