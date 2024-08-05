
import 'package:flutter/material.dart';

const colorList = <Color>[
Colors.white,
Colors.green,
Colors.blue,
Colors.yellow,
Colors.purple,
Colors.orange,
Colors.pink,
];

class AppTheme{
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({ this.selectedColor = 0,
  this.isDarkMode = false})
  : assert(selectedColor >=0,'Selected color must be greater then 0'),
  assert(selectedColor < colorList.length,'Selected color must be less or equal to ${colorList.length - 1}');


  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );

  AppTheme copyWith({int? selectedColor,bool? isDarkMode}){
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode
    );
  }
}