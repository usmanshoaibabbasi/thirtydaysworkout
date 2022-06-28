import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/modals/gym_diet_modal.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class GymDietPlanDays extends StatefulWidget {
  final int daynumber;
  const GymDietPlanDays({Key? key, required this.daynumber}) : super(key: key);

  @override
  State<GymDietPlanDays> createState() => _GymDietPlanDaysState();
}

class _GymDietPlanDaysState extends State<GymDietPlanDays> {
  List<perDayGymDietPlanModal> per_Day_GymDiet_Data_List = [];
  @override
  void initState() {
    getEveyDayGymDietPlan(widget.daynumber);
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
            header(context: context, navbartxt: 'Everyday Diet Plans'),
            per_Day_GymDiet_Data_List.isNotEmpty ?
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
                        'DAY ${per_Day_GymDiet_Data_List[0].day}',
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
                        per_Day_GymDiet_Data_List[0].breakfast.toString(),
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
                        per_Day_GymDiet_Data_List[0].lunch.toString(),
                        style: eveyDayDietPlanDescriptionGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'PRE WORKOUT SNACKS',
                        style: eveyDayDietPlanHeadingGoogleFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        per_Day_GymDiet_Data_List[0].preWorkOutSnak.toString(),
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
                        per_Day_GymDiet_Data_List[0].dinner.toString(),
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

  void getEveyDayGymDietPlan(int daynumber) async {
    var dbHelper = DBHelper();
    List<perDayGymDietPlanModal> perDayGymDietDataList =
        await dbHelper.perDayGymDietDataFetch(daynumber);
    setState(() {
      // print('perDayDataList');
      // print(perDayDataList);
      per_Day_GymDiet_Data_List = perDayGymDietDataList;
    });
  }
}
