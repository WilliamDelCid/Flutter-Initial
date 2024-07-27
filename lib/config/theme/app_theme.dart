
import 'package:flutter/material.dart';

const colorList = <Color>[
Colors.red,
Colors.green,
Colors.blue,
Colors.yellow,
Colors.purple,
Colors.orange,
Colors.pink,
];

class AppTheme{
  final int selectedColor;

  AppTheme({ this.selectedColor = 0})
  : assert(selectedColor >=0,'Selected color must be greater then 0'),
  assert(selectedColor < colorList.length,'Selected color must be less or equal to ${colorList.length - 1}');


  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );


}