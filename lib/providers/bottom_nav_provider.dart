import 'package:flutter/foundation.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';

class BottomNavProvider with ChangeNotifier{
  int _currentIndex  = 2;
  int get currentIndex => _currentIndex ;
  void setindex(int index) {
    _currentIndex  = index;
    AdHelper.interstitialAdCount +=1;
    if(AdHelper.interstitialAdCount == AdHelper.noTabsToShowAdd) {
      InterstitialAdclass.showInterstitialAd();
    }
    notifyListeners();
  }
}