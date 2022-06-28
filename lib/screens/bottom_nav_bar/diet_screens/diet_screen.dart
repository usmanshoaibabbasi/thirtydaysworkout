import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
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
  DBHelper dbHelper = DBHelper();
  @override
  void initState() {
    dbHelper.initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      backgroundColor: homebackgroundcolor,
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            bottomNavProvider.setindex(1);
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            bottomNavProvider.setindex(3);
          }
        },
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
                    GestureDetector(
                      onTap: () {
                        bottomNavProvider.setindex(4);
                      },
                      child: Image.asset(homepageimage,
                          height: screenheight * 0.35,
                          width: screenwidth,
                          fit: BoxFit.fill),
                    ),

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
}
