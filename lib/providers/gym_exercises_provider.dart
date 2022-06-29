import 'package:flutter/foundation.dart';
import 'package:thirty_days_workout/modals/gym_exercises_modal.dart';

class GymExercisesFullProvider with ChangeNotifier {

  bool _loading = false;

  bool get loading => _loading;

  void setloading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  ///
  
  List<gymExercisesModal> _gymExercisesFullList = [];
  List get gymExercisesFullList => _gymExercisesFullList;

  void setgymExercisesFullList(List<gymExercisesModal> listget) {
    _gymExercisesFullList = listget;
    notifyListeners();
  }
}