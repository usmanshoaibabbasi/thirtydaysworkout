import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/weight_gain_plan_modal.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_gain_screens/weight_gain_diet_plan_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class WeightGainPlan extends StatefulWidget {
  const WeightGainPlan({Key? key}) : super(key: key);

  @override
  State<WeightGainPlan> createState() => _WeightGainPlanState();
}

class _WeightGainPlanState extends State<WeightGainPlan> {
  List<weightGainDietPlanModal> seven_day_weight_gain_diet_plan_list = [];
  @override
  void initState() {
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
}
