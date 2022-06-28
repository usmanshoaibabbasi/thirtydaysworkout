import 'package:flutter/foundation.dart';

class BottomNavProvider with ChangeNotifier{
  int _currentIndex  = 2;
  int get currentIndex => _currentIndex ;
  void setindex(int index) {
    _currentIndex  = index;
    notifyListeners();
  }
}