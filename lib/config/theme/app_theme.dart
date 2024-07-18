import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);

List<Color> _colorThemes = [
  _customColor,
  Colors.pink,
  Colors.blue,
  Colors.black,
  Colors.green,
  Colors.orange,
];


enum AppThemeType {
  light,
  datk
}

class AppTheme {

  final int selectedColor;
  final AppThemeType themeType;

  AppTheme({
    this.selectedColor = 0,
    this.themeType = AppThemeType.light
  }): assert( selectedColor >= 0, 'Colors must be between 0 and ${_colorThemes.length}' );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: themeType == AppThemeType.light ? Brightness.light : Brightness.dark,
    );
  }

}