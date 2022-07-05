import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/providers/home_provider.dart';
import 'package:thirty_days_workout/providers/universal_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_days_list_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/home_widget.dart';

class HomeClass extends StatefulWidget {
  const HomeClass({Key? key}) : super(key: key);

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  late NativeAd _ad;
  bool isLoaded = false;
  bool waiting = true;
  @override
  void initState() {
    final universalProvider = Provider.of<UniversalProvider>(context, listen: false);
    if(universalProvider.showAdds == true) {
      loadNativeAd();
    }
    getHomeDaysList().then((value) => {
          Future.delayed(const Duration(milliseconds: 1500), () {
            setState(() {
              waiting = false;
            });
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      backgroundColor: homebackgroundcolor,
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              // if (details.delta.dx > 0) {
              //   bottomNavProvider.setindex(1);
              // }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                bottomNavProvider.setindex(1);
              }
            },
            child: Column(
              children: [
                header(
                  context: context,
                  navbartxt: "Let's Go !",
                ),
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
                ):
                Image.asset(homepageimage,
                    height: 200, width: screenwidth, fit: BoxFit.cover),
                homeProvider.home_days_List.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: homeProvider.home_days_List.length,
                            itemBuilder: (context, index) {
                              return homeDaysListCard(
                                indexOfHomeDaysList:
                                    homeProvider.home_days_List[index],
                                lastindex: homeProvider.home_days_List.length,
                                index: index,
                              );
                            }),
                      )
                    : const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
              ],
            ),
          ),
          waiting == true
              ? Container(
                  color: Colors.white,
                  child: animatedListvieweffects(context: context))
              : Container(),
        ],
      ),
    );
  }

  Future getHomeDaysList() async {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    var dbHelper = DBHelper();
    List<homeDaysModal> homeDaysList = await dbHelper.gethomelist();
    // List<homeDaysModalFullData> homeDaysListfulldata = await dbHelper.gethomelistfulldata();
    homeProvider.setHomeDayList(homeDaysList);
    // homeProvider.setHomeDayListfulldata(homeDaysListfulldata);
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
