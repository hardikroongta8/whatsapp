import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark 
    ? ThemeMode.dark 
    : ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {

    themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;

    notifyListeners();
  }

}
