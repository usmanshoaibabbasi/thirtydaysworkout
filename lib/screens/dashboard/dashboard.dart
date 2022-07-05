import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';
import 'package:thirty_days_workout/helpers/app_open_addmanager.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/providers/universal_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/account_screens/account_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/bmi_screens/bmi_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/diet_screen.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/health_tips_screens/health_screen.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with WidgetsBindingObserver{
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();
  bool isPaused = false;
  final screens = [
    const HomeClass(),
    const BMIClass(),
    const DietClass(),
    const HealthClass(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    var universalProvider;
    // TODO: implement initState
    ToshowadorNot().then((value) => {
     universalProvider = Provider.of<UniversalProvider>(context, listen: false),
    if(universalProvider.showAdds == true) {
        appOpenAdManager.loadAd(),
    WidgetsBinding.instance.addObserver(this),
      if (InterstitialAdclass.interstitialAd == null) {
        if(kDebugMode) {
          print('interstitial ad'),
        },
        InterstitialAdclass.createInterstitialAd(),
      }
    }
    });
    ///
    Future.delayed(Duration.zero).then((value) {
      if(Provider.of<UniversalProvider>(context, listen: false).showReviewDialog == true){
        Provider.of<UniversalProvider>(context,listen: false).toggleReviewDialogToFalse();
        rateMyApp.init().then((_) {
          if (rateMyApp.shouldOpenDialog) {
            rateMyApp.showRateDialog(
              context,
              title: 'Rate this App',
              message:
              'if you like this app, then please take a liitle time to review our app',
              rateButton: 'Rate',
              laterButton: 'Maybe Later',
              noButton: 'Never',
              onDismissed: () =>
                  rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
            );
          }
        });
      }
    });
    ///
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      isPaused = true;
    }
    if (state == AppLifecycleState.resumed && isPaused) {
      print("Resumed==========================");
      appOpenAdManager.showAdIfAvailable();
      isPaused = false;
    }
  }
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    if (kDebugMode) {
      // print('build');
    }
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          body: Center(
            child: screens[bottomNavProvider.currentIndex],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            color: navbarcolor,
            backgroundColor: Colors.transparent,
            items: const <Widget>[
              Icon(
                CupertinoIcons.house,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.bolt,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.bag,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.heart_fill,
                size: 30,
                color: unSelectedIconColor,
              ),
              Icon(
                CupertinoIcons.person_solid,
                size: 30,
                color: unSelectedIconColor,
              ),
            ],
            height: 60,
            index: bottomNavProvider.currentIndex,
            buttonBackgroundColor: navbarcolor,
            // onTap: (index) => setState(() {
            //   this.index = index;
            // }),
            onTap: (index) {
              bottomNavProvider.setindex(index);
            },
          )),
    );
  }
  final RateMyApp rateMyApp = RateMyApp(
      minDays: 0,
      minLaunches: 3,
      googlePlayIdentifier: 'fr.skyost.example',
      // appStoreIdentifier: '',
      remindDays: 0,
      remindLaunches: 1);

  Future ToshowadorNot() async {
    final universalProvider = Provider.of<UniversalProvider>(context, listen: false);
    final docgymexercise = FirebaseFirestore.instance
        .collection('google_admob_show')
        .doc('wJrlnsrZorFf0JuW1W3n');
    final snapshot = await docgymexercise.get();

    if (snapshot.exists) {
      var adshow = snapshot.data()!['show_ads'];
      if (kDebugMode) {
        print(snapshot.data()!['show_ads']);
      }
      universalProvider.ToshowAddsOrNot(adshow);
      return snapshot.data();
    } else {
    }
  }
}
