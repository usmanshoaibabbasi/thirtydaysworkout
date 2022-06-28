// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';

class HomeEveryDayProvider with ChangeNotifier {
  List<everyDayExerciseModal> _everyday_Exercise_List = [];
  List get everyday_Exercise_List => _everyday_Exercise_List;

  ///
  final List<int> _exercisecomplletionlist = [];
  List get exercisecomplletionlist {
    return _exercisecomplletionlist;
  }

  void setHomeEveryDayList(List<everyDayExerciseModal> listget) {
    _everyday_Exercise_List = listget;
    notifyListeners();
  }

  void addListToValues(int listlength, bool whatToDo, int valOfB) {
    // if (kDebugMode) {
    //   print('Enter in Provider addListToValues');
    // }
    _exercisecomplletionlist.clear();
    // if (kDebugMode) {
    //   print('Initially List $_exercisecomplletionlist');
    // }
    for (int i = 0; i < listlength; i++) {
      _exercisecomplletionlist.add(0);
    }
    // if (kDebugMode) {
    //   print('After adding item in list $_exercisecomplletionlist');
    // }
    if (whatToDo == false) {
      // if (kDebugMode) {
      //   print('What To Do False');
      // }
      int b = 0;
      while (b < everyday_Exercise_List.length && everyday_Exercise_List[b].status == 1) {
        b = b + 1;
      }
      // if (kDebugMode) {
      //   print('To Check How many Exercises are Done ${b.toString()}');
      // }
      int c = 0;
      while (c < b) {
        exercisecomplletionlist[c] = 1;
        c = c + 1;
      }
      // if (kDebugMode) {
      //   print('Finally List Is Here $exercisecomplletionlist');
      // }
    } else if (whatToDo == true) {
      // if (kDebugMode) {
      //   print('What To Do True');
      //   print(valOfB);
      // }
      int j = 0;
      while (j < valOfB) {
        exercisecomplletionlist[j] = 1;
        j = j + 1;
      }
    }
    notifyListeners();
  }
}
