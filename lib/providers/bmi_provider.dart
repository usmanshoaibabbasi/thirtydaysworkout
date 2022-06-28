import 'dart:ffi';

import 'package:flutter/foundation.dart';

class BmiProvider with ChangeNotifier {
  bool _genderSelected = true;
  // double _ageValue = 20.0;
  bool get genderSelected => _genderSelected;
  // double get ageValue => _ageValue;

  void setgenderSelected(bool gender) {
    _genderSelected = gender;
    notifyListeners();
  }

}

class BmiAgeProvider with ChangeNotifier {
  double _ageValue = 20.0;
  double get ageValue => _ageValue;
  ///
  /// Function for increment decrement
  void incdecage(bool incdec) {
    // if(kDebugMode) {
    //   print('Eneter in incre decre');
    // }
    if(incdec == true) {
      if(kDebugMode) {
        // print('incree');
      }
      _ageValue--;
    }
    if (incdec == false) {
      if(kDebugMode) {
        // print('incree');
      }
      _ageValue++;
    }
    notifyListeners();
  }
  ///
  /// Slider Function
  void sliderval(double val) {
    _ageValue = val;
    notifyListeners();
  }

}

class BmiResultInBlurProvider with ChangeNotifier {
  bool _blur = false;
  bool get blur => _blur ;
  ///
  void setblur(bool blurvalpass) {
    // if(kDebugMode) {
    //   print('Eneter in blurvalpas');
    // }
    _blur  = blurvalpass;
    notifyListeners();
  }
}

class BmiWeightProvider with ChangeNotifier {
  String _weightUnit = 'KG';
  String get weightUnit => _weightUnit ;
  ///
  void setWeight(String weightvalpass) {
    // if(kDebugMode) {
    //   print('Eneter in setWeight');
    // }
    _weightUnit  = weightvalpass;
    notifyListeners();
  }

}

class BmiHeightProvider with ChangeNotifier {
  String _heightUnit = 'CM';
  String get heightUnit => _heightUnit ;
  ///
  void setHeight(String heightvalpass) {
    // if(kDebugMode) {
    //   print('Eneter in setWeight');
    // }
    _heightUnit  = heightvalpass;
    notifyListeners();
  }

}