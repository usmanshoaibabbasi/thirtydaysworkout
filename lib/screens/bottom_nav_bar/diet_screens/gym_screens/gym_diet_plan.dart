import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/gym_diet_modal.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/diet_screens/gym_screens/gym_diet_plan_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class GymDietPlan extends StatefulWidget {
  const GymDietPlan({Key? key}) : super(key: key);

  @override
  State<GymDietPlan> createState() => _GymDietPlanState();
}

class _GymDietPlanState extends State<GymDietPlan> {
  List<gymDietPlanModal> seven_day_gym_diet_plan_list = [];
  @override
  void initState() {
    getGymDietPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: homebackgroundcolor,
        body: Column(
          children: [
            header(
              context: context,
              navbartxt: "Gym Diet Plans",
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(homepageimage,
                height: 200, width: screenwidth, fit: BoxFit.cover,),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: seven_day_gym_diet_plan_list.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GymDietPlanCard(
                      indexofGymDietPlanList:
                          seven_day_gym_diet_plan_list[index],
                          lastindex: seven_day_gym_diet_plan_list.length,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void getGymDietPlan() async {
    /// https://youtu.be/3BWc1py3XY0
    var dbHelper = DBHelper();
    List<gymDietPlanModal> sevenDayGymDietPlanList =
        await dbHelper.getGymDietPlan();
    setState(() {
      seven_day_gym_diet_plan_list = sevenDayGymDietPlanList;
    });
  }
}
