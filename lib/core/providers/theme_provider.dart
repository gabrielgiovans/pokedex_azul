import 'package:flutter/material.dart';

//This is the theme provider, by default it always defaults to the light theme
class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  bool get isLightMode => themeMode == ThemeMode.light;

//this function is responsible for changing the light theme to dark
//and notifying the app about the change
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
