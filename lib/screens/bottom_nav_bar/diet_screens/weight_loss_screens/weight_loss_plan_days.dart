import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/weight_loss_plan_modal.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class WeightLossDietPlanDays extends StatefulWidget {
  final int daynumber;
  const WeightLossDietPlanDays({Key? key,required this.daynumber}) : super(key: key);

  @override
  State<WeightLossDietPlanDays> createState() => _WeightLossDietPlanDaysState();
}

class _WeightLossDietPlanDaysState extends State<WeightLossDietPlanDays> {
  List<perDayWeightLossPlanModal> per_Day_WeightLoss_Data_List = [];
  @override
  void initState() {
    getEveyDayWeightLossDietPlan(widget.daynumber);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context: context, navbartxt: 'Weight Loss Plan'),
            per_Day_WeightLoss_Data_List.isNotEmpty ?
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenwidth,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'DAY ${per_Day_WeightLoss_Data_List[0].day}',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenheight * 0.12,
                            width: screenheight * 0.12,
                            child: Image.asset(
                              fitnesslogo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'BREAKFAST',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].breakfast.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'AM SNACKS',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].amsnacks.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'LUNCH',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].lunch.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PM SNACKS',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].pmsnacks.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'DINNER',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].dinner.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PREP TIP',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].preptip.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'TOTAL',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightLoss_Data_List[0].total.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
            ):
            const CircularProgressIndicator(),
            Image.asset(splashscreenimg,
              height: screenheight * 0.35, width: screenwidth, fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
  void getEveyDayWeightLossDietPlan(int daynumber) async {
    var dbHelper = DBHelper();
    List<perDayWeightLossPlanModal> perDayWeightLossDataList =
    await dbHelper.perDayWeightLossDataFetch(daynumber);
    setState(() {
      // print('perDayDataList');
      // print(perDayDataList);
      per_Day_WeightLoss_Data_List = perDayWeightLossDataList;
    });
  }
}
