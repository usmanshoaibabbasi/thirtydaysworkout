import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/widgets/diet_widget.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class DietClass extends StatefulWidget {
  const DietClass({Key? key}) : super(key: key);

  @override
  State<DietClass> createState() => _DietClassState();
}

class _DietClassState extends State<DietClass> {
  /// Native Ad
  late NativeAd _ad;
  bool isLoaded = false;

  /// Native Ad
  @override
  void initState() {
    loadNativeAd();
    super.initState();
  }

  @override
  void dispose() {
    _ad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      backgroundColor: homebackgroundcolor,
      body: GestureDetector(
        // onPanUpdate: (details) {
        //   // Swiping in right direction.
        //   if (details.delta.dx > 0) {
        //     bottomNavProvider.setindex(1);
        //   }
        //
        //   // Swiping in left direction.
        //   if (details.delta.dx < 0) {
        //     bottomNavProvider.setindex(3);
        //   }
        // },
        child: Column(
          children: [
            header(
              context: context,
              navbartxt: "Diet Plans",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// 1st SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    isLoaded
                        ? SingleChildScrollView(
                          child: Container(
                              height: screenheight * 0.41,
                              color: Colors.black12,
                              child: AdWidget(
                                ad: _ad,
                              ),
                            ),
                        )
                        : Image.asset(homepageimage,
                            height: screenheight * 0.35,
                            width: screenwidth,
                            fit: BoxFit.fill),

                    /// 2nd SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    dietPlan(
                        context: context,
                        passimagepath: heathscreenbeautyimg,
                        passtext: 'Weight Loss Plan',
                        passontap: () {
                          Navigator.pushNamed(context, weightLossPlanRoute);
                        }),

                    /// 3rd SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    dietPlan(
                        context: context,
                        passimagepath: heathscreenbeautyimg,
                        passtext: '7 Day Gym Diet Plan',
                        passontap: () {
                          Navigator.pushNamed(context, gymDietPlanRoute);
                        }),

                    /// 4th SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    dietPlan(
                        context: context,
                        passimagepath: heathscreenbeautyimg,
                        passtext: '7 day Weight Gain Diet Plan',
                        passontap: () {
                          Navigator.pushNamed(context, weightGainRoute);
                        }),

                    /// 4th SizedBox
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadNativeAd() {
    _ad = NativeAd(
        request: const AdRequest(),

        ///This is a test adUnitId make sure to change it
        adUnitId: AdHelper.nativeAd,
        factoryId: 'listTile',
        listener: NativeAdListener(onAdLoaded: (ad) {
          if (kDebugMode) {
            print('Ad loaded');
          }
          setState(() {
            isLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (kDebugMode) {
            print('failed to load the ad ${error.message}, ${error.code}');
          }
        }));

    _ad.load();
  }
}
