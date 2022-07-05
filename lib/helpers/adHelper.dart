import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdHelper {
//   /// video link for interstitial ad. ///
//   /// https://youtu.be/MLEOFZoxMxc ///
//
//   static String get bannerAdUnitId {
//     return 'ca-app-pub-3940256099942544/6300978111';
//   }
//
//   static String get interstitialAd {
//     return 'ca-app-pub-3940256099942544/1033173712';
//   }
// }

const int maxFailLoadAttempts = 3;

class InterstitialAdclass {
  static InterstitialAd? interstitialAd;
  static int _interstitialAdLoadAttempts = 0;

  static void createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAd,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          if (kDebugMode) {
            print('add loaded');
          }
          interstitialAd = ad;
          _interstitialAdLoadAttempts = 0;
        },
        onAdFailedToLoad: (error) {
          if (kDebugMode) {
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


class AdHelper {
  static int noTabsToShowAdd = 4;
  static int interstitialAdCount = 0;
  static String get interstitialAd {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get nativeAd {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/2247696110';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }

  static String get openAppAd {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/3419835294';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/5662855259';
    }
    throw UnsupportedError("Unsupported platform");
  }
}