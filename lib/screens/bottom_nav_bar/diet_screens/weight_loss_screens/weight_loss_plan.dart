import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/weight_loss_plan_modal.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/weight_loss_screens/weight_loss_plan_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class WeightLossPlan extends StatefulWidget {
  const WeightLossPlan({Key? key}) : super(key: key);

  @override
  State<WeightLossPlan> createState() => _WeightLossPlanState();
}

class _WeightLossPlanState extends State<WeightLossPlan> {
  List<weightLossPlanModal> thirty_day_weight_loss_plan_list = [];
  @override
  void initState() {
    getweightLossPlan();
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
              navbartxt: "Weight Loss Plans",
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(homepageimage,
              height: 200, width: screenwidth, fit: BoxFit.cover,),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: thirty_day_weight_loss_plan_list.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return WeightLossPlanCard(
                      indexofWeightLossDietPlanList: thirty_day_weight_loss_plan_list[index],
                      lastindex: thirty_day_weight_loss_plan_list.length
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
  void getweightLossPlan() async {
    /// https://youtu.be/3BWc1py3XY0
    var dbHelper = DBHelper();
    List<weightLossPlanModal> thirtyDayWeightLossPlanList =
    await dbHelper.getweightLossPlan();
    setState(() {
      thirty_day_weight_loss_plan_list = thirtyDayWeightLossPlanList;
    });
  }
}
