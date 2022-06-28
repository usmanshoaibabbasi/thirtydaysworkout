// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';

class homeDaysListCard extends StatefulWidget {
  final homeDaysModal indexOfHomeDaysList;
  final int lastindex;
  final int index;
  const homeDaysListCard({
    Key? key,
    required this.indexOfHomeDaysList,
    required this.lastindex,
    required this.index,
  }) : super(key: key);

  @override
  State<homeDaysListCard> createState() => _homeDaysListCardState();
}

class _homeDaysListCardState extends State<homeDaysListCard> {
  List<homeDaysModalFullData> how_much_work_list = [];
  var percentageofwork;
  double percent = 0.0;
  @override
  void initState() {
    howmuchworkdone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final screenwidth = MediaQuery.of(context).size.width;
    // final homeDayProviderFullData =
    //     Provider.of<HomeProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (widget.indexOfHomeDaysList.status == 1 ||
            widget.indexOfHomeDaysList.status == 2) {
          if (kDebugMode) {
            print('Move Forward');
            print(widget.indexOfHomeDaysList.status.toString());
          }
          Navigator.pushNamed(
            context,
            homeEveryDayExerciseRoute,
            arguments: {
              'daynumber': widget.indexOfHomeDaysList.day,
            },
          );
        } else if (widget.indexOfHomeDaysList.status == 0) {
          if (kDebugMode) {
            print('Stay Here');
          }
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Complete your Previous day tasks'),
            duration: const Duration(milliseconds: 800),
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            ),
          ));
        }
      },
      child: Container(
        margin: widget.indexOfHomeDaysList.day == widget.lastindex
            ? const EdgeInsets.fromLTRB(10, 15, 10, 20)
            : const EdgeInsets.fromLTRB(10, 15, 10, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: widget.indexOfHomeDaysList.status == 0
              ? const Color(0xffE0E0E0)
              : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 9.0,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day ${widget.indexOfHomeDaysList.day}',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: dietplandayslisttextcolor),
              ),
              widget.indexOfHomeDaysList.status == 2
                  ? CircularPercentIndicator(
                      radius: 25.0,
                      lineWidth: 5.0,
                      animation: true,
                      animationDuration: 500,
                      percent: 0 / 100,
                      center: const Text(
                        '',
                      ),
                      backgroundColor: const Color(0xffFFFFFF),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: const Color(0xffFFFFFF),
                    )
                  : percentageofwork == 0
                      ? CircularPercentIndicator(
                          radius: 25.0,
                          lineWidth: 5.0,
                          animation: true,
                          animationDuration: 500,
                          percent: 0 / 100,
                          center: const Text(
                            '',
                          ),
                          backgroundColor: const Color(0xffE0E0E0),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: navbarcolor,
                        )
                      : percentageofwork == 100
                          ? Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 25.0,
                                  lineWidth: 5.0,
                                  animation: true,
                                  animationDuration: 500,
                                  percent: percent / 100,
                                  center: const Text(
                                    '',
                                  ),
                                  backgroundColor: Colors.white,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.white,
                                ),
                                Image.asset(
                                  trophy,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            )
                          : CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 5.0,
                              animation: true,
                              animationDuration: 500,
                              percent: percent / 100,
                              center: Text(
                                "$percentageofwork%",
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                              backgroundColor: Colors.white,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: navbarcolor,
                            ),
            ],
          ),
        ),
      ),
    );
  }

  void howmuchworkdone() async {
    // if (kDebugMode) {
    //   print('enter in howmuchworkdone');
    // }
    var dbHelper = DBHelper();
    List<homeDaysModalFullData> homeDaysListfulldata =
        await dbHelper.gethowmuchworkdone(widget.indexOfHomeDaysList.id);
    setState(() {
      how_much_work_list = homeDaysListfulldata;
    });
    int b = 0;
    while (b < how_much_work_list.length && how_much_work_list[b].status == 1) {
      b = b + 1;
    }
    percentageofwork = (b / how_much_work_list.length);
    percentageofwork = (percentageofwork * 100).round();
    percent = percentageofwork.toDouble();
  }
}
