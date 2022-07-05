import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/adHelper.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/weight_gain_plan_modal.dart';
import 'package:thirty_days_workout/providers/universal_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_gain_screens/weight_gain_diet_plan_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class WeightGainPlan extends StatefulWidget {
  const WeightGainPlan({Key? key}) : super(key: key);

  @override
  State<WeightGainPlan> createState() => _WeightGainPlanState();
}

class _WeightGainPlanState extends State<WeightGainPlan> {
  List<weightGainDietPlanModal> seven_day_weight_gain_diet_plan_list = [];
  late NativeAd _ad;
  bool isLoaded = false;
  @override
  void initState() {
    final universalProvider = Provider.of<UniversalProvider>(context, listen: false);
    if(universalProvider.showAdds == true) {
      loadNativeAd();
    }
    getweightGainDietPlan();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: homebackgroundcolor,
        body: Column(
          children: [
            header(
              context: context,
              navbartxt: "Weight Gain Diet Plans",
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
              height: 200, width: screenwidth, fit: BoxFit.cover,),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: seven_day_weight_gain_diet_plan_list.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return WeightGainDietPlanCard(
                      indexofWeightGainDietPlanList: seven_day_weight_gain_diet_plan_list[index],
                      lastindex: seven_day_weight_gain_diet_plan_list.length,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  void getweightGainDietPlan() async {
    /// https://youtu.be/3BWc1py3XY0
    var dbHelper = DBHelper();
    List<weightGainDietPlanModal> sevenDayWeightGainDietPlanList =
    await dbHelper.getweightGainDietPlan();
    setState(() {
      seven_day_weight_gain_diet_plan_list = sevenDayWeightGainDietPlanList;
    });
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
