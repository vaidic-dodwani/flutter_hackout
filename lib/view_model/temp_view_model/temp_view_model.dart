import 'package:flutter/material.dart';

class HomeNotifier extends ChangeNotifier {
//
  int _selectedScreen = 0;
  int get selectedScreen => _selectedScreen;
  set selectedScreen(int _) {
    _selectedScreen = _;
    notifyListeners();
  }
//
}
