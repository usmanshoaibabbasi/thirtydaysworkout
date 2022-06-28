import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/providers/home_everyday_provider.dart';
import 'package:thirty_days_workout/screens/bottom_nav_bar/home_screens/home_everyday_exercise_card.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class homeEveryDayExercise extends StatefulWidget {
  final int daynumber;
  const homeEveryDayExercise({Key? key, required this.daynumber})
      : super(key: key);

  @override
  State<homeEveryDayExercise> createState() => _homeEveryDayExerciseState();
}

class _homeEveryDayExerciseState extends State<homeEveryDayExercise> {
  @override
  void initState() {
    getEveryDayExerciseList(widget.daynumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final homeEveryDayProvider =
        Provider.of<HomeEveryDayProvider>(context, listen: true);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          bottomNavProvider.setindex(0);
          Navigator.pushNamedAndRemoveUntil(
            context,
            dashBoardRoute,
            ModalRoute.withName(dashBoardRoute),
          );
          return true;
        },
        child: Scaffold(
          backgroundColor: homebackgroundcolor,
          body: homeEveryDayProvider.everyday_Exercise_List.isNotEmpty
              ? Column(
                  children: [
                    everyDayExerciseheader(
                        context: context,
                        navbar1sttxt:
                            "Day ${homeEveryDayProvider.everyday_Exercise_List[0].day}",
                        navbar2ndtxt:
                            "WorkOuts: ${homeEveryDayProvider.everyday_Exercise_List.length}"),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(homepageimage,
                        height: 200, width: screenwidth, fit: BoxFit.cover),
                    Expanded(
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: homeEveryDayProvider
                              .everyday_Exercise_List.length,
                          itemBuilder: (context, index) {
                            return HomeEveryDayExerciseCard(
                              indexofEveryDayExercise: homeEveryDayProvider
                                  .everyday_Exercise_List[index],
                              lastindex: homeEveryDayProvider
                                  .everyday_Exercise_List.length,
                              firstindex: homeEveryDayProvider
                                      .everyday_Exercise_List[0].id -
                                  1,
                              index: index + 1,
                            );
                          }),
                    )
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  void getEveryDayExerciseList(int daynumber) async {
    final homeEveryDayProvider =
        Provider.of<HomeEveryDayProvider>(context, listen: false);
    var dbHelper = DBHelper();
    List<everyDayExerciseModal> everyDayExerciseList =
        await dbHelper.getEveryDayExerciselist(daynumber);
    homeEveryDayProvider.setHomeEveryDayList(everyDayExerciseList);

    ///
    checkCompletedExercises();
  }

  void checkCompletedExercises() {
    if (kDebugMode) {
      print('Enter in checkCompletedExercises');
    }
    final homeEveryDayProvider =
        Provider.of<HomeEveryDayProvider>(context, listen: false);
    int a = homeEveryDayProvider.everyday_Exercise_List.length;
    if (kDebugMode) {
      print('Number Of Exercises in Day ${a.toString()}');
    }
    int valOfB = 0;
    homeEveryDayProvider.addListToValues(a, false, valOfB);
  }
}
