// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';

class HomeProvider with ChangeNotifier {
  List<homeDaysModal> _home_days_List = [];
  List get home_days_List => _home_days_List;

  void setHomeDayList(List<homeDaysModal> listget) {
    _home_days_List = listget;
    notifyListeners();
  }
  /// Full data
  // List<homeDaysModalFullData> _home_days_List_full_data = [];
  // List get home_days_List_full_data => _home_days_List_full_data;

  // void setHomeDayListfulldata(List<homeDaysModalFullData> listget) {
  //   _home_days_List_full_data = listget;
  //   notifyListeners();
  // }
}