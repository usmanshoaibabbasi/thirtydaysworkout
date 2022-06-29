import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  /// video link for interstitial ad. ///
  /// https://youtu.be/MLEOFZoxMxc ///
  static int noTabsToShowAdd = 2;
  static int interstitialAdCount = 0;
  static String get bannerAdUnitId {
    return 'ca-app-pub-3940256099942544/6300978111';
  }

  static String get interstitialAd {
    return 'ca-app-pub-3940256099942544/1033173712';
  }
}

const int maxFailLoadAttempts = 3;

class InterstitialAdclass {
  static InterstitialAd? interstitialAd;
  static int _interstitialAdLoadAttempts = 0;

  
  static void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAd,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if(kDebugMode) {
            print('add loaded');
          }
          interstitialAd = ad;
          _interstitialAdLoadAttempts = 0;
        },
        onAdFailedToLoad: (error) {
          if(kDebugMode) {
            print('add Failed to load');
          }
          _interstitialAdLoadAttempts += 1;
          interstitialAd = null;
          if (_interstitialAdLoadAttempts <= maxFailLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }



  static void showInterstitialAd() {
    if (interstitialAd != null) {
      AdHelper.interstitialAdCount = 0;
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        createInterstitialAd();
      }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
        createInterstitialAd();
      });
      interstitialAd!.show();
    }
  }
}