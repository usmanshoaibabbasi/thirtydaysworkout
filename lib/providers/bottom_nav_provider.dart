import 'package:flutter/foundation.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';

class BottomNavProvider with ChangeNotifier{
  int _currentIndex  = 1;
  int get currentIndex => _currentIndex ;
  void setindex(int index) {
    _currentIndex  = index;
    if(kDebugMode) {
      print('11111111111111111');
    print(AdHelper.interstitialAdCount);
    }
    AdHelper.interstitialAdCount +=1;
    if(kDebugMode) {
      print('222222222222222');
    print(AdHelper.interstitialAdCount);
    }
    if(AdHelper.interstitialAdCount == AdHelper.noTabsToShowAdd) {
      InterstitialAdclass.showInterstitialAd();
    }
    notifyListeners();
  }
}