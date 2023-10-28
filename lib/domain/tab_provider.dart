import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _currentTab = 0;

  int get currentTab => _currentTab;

  void setCurrentTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
