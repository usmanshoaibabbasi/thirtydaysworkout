import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/weight_gain_plan_modal.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class WeightGainDietPlanDays extends StatefulWidget {
  final int daynumber;
  const WeightGainDietPlanDays({Key? key,required this.daynumber}) : super(key: key);

  @override
  State<WeightGainDietPlanDays> createState() => _WeightGainDietPlanDaysState();
}

class _WeightGainDietPlanDaysState extends State<WeightGainDietPlanDays> {
  List<perDayWeightGainDietPlanModal> per_Day_WeightGain_Data_List = [];
  @override
  void initState() {
    getEveyDayWeightGainDietPlan(widget.daynumber);
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
            header(context: context, navbartxt: 'Weight Gain Diet Plan'),
            per_Day_WeightGain_Data_List.isNotEmpty ?
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
                        'DAY ${per_Day_WeightGain_Data_List[0].day}',
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
                        per_Day_WeightGain_Data_List[0].breakfast.toString(),
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
                        per_Day_WeightGain_Data_List[0].lunch.toString(),
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
                        per_Day_WeightGain_Data_List[0].Dinner.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'SUPPER',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightGain_Data_List[0].Supper.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'SNACKS',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_WeightGain_Data_List[0].Snacks.toString(),
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
  void getEveyDayWeightGainDietPlan(int daynumber) async {
    var dbHelper = DBHelper();
    List<perDayWeightGainDietPlanModal> perDayWeightGainDataList =
    await dbHelper.perDayWeightGainDataFetch(daynumber);
    setState(() {
      // print('perDayDataList');
      // print(perDayDataList);
      per_Day_WeightGain_Data_List = perDayWeightGainDataList;
    });
  }
}
