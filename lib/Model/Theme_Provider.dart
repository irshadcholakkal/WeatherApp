import 'package:flutter/material.dart';
import 'package:weather/ViewModel/Themes.dart';

class ThemeProvider extends ChangeNotifier {

 
  ThemeData themeData = LightTheme;

  ThemeData get currenttheme => themeData;
  

   void setTheme(ThemeData newtheme) {
    themeData = newtheme;
  //  notifyListeners();
  }

  void setThemeBasedOnTime(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour * 100 + now.minute;

    if (hour >= 500 && hour < 1700) {
       setTheme(LightTheme);
    } else {
      setTheme(DarkTheme);
    }
    // notifyListeners();
  }

 
} 
