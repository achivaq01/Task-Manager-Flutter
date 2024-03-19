import 'package:flutter/material.dart';

enum Views {
  home
}

class AppData with ChangeNotifier {
  Views _currentView = Views.home;
  ThemeData _currentTheme = ThemeData.dark();
  int size = 10;


  Views get views => _currentView;
  set views(Views view) {
    _currentView = view;
    notifyListeners();
  }

  ThemeData get theme => _currentTheme;
  set theme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

}