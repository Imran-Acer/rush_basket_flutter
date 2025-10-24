import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier{
  ThemeMode _theme=ThemeMode.light;

  ThemeMode getTheme()=>_theme;
  changeTheme(){
    if(_theme==ThemeMode.light){
      _theme=ThemeMode.dark;
      notifyListeners();
    }
    else{
      _theme=ThemeMode.light;
      notifyListeners();
    }
  }
}