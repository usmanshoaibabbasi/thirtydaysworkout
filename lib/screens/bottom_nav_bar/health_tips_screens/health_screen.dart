import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:thirty_days_workout/widgets/health_widget.dart';

class HealthClass extends StatelessWidget {
  const HealthClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      backgroundColor: homebackgroundcolor,
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            bottomNavProvider.setindex(2);
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {
            bottomNavProvider.setindex(4);
          }
        },
        child: Column(
          children: [
            /// header
            header(
              context: context,
              navbartxt: "Health Tips",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 1st SizedBox
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(healthscreenimage,
                        height: 200, width: screenwidth, fit: BoxFit.cover),

                    /// 2nd SizedBox
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, livingTipsRoute);
                            // Navigator.of(context).push(
                            // CustomPageRoute(
                            //   child: const LivingTips(),
                            //   direction: AxisDirection.up,
                            // ),
                            // );
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreenlivingimg,
                              passtext: 'Living'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, nutritionTipsRoute);
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreennutritionimg,
                              passtext: 'Nutrition'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                      ],
                    ),

                    /// 3rd SizedBox
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, yogaTipsRoute);
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreenyogaimg,
                              passtext: 'Yoga'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, adultTipsRoute);
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreenadultimg,
                              passtext: 'Adult'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                      ],
                    ),

                    /// 4th SizedBox
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, pregnancyTipsRoute);
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreenpregnancyimg,
                              passtext: 'Pregnancy'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, beautyTipsRoute);
                          },
                          child: healthtipContainer(
                              context: context,
                              passimagepath: heathscreenbeautyimg,
                              passtext: 'Beauty'),
                        ),
                        SizedBox(
                          width: screenwidth * 0.05,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    )
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
