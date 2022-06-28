import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int percent = 0;
  bool buttonshow = false;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      setState(() {
        percent += 20;
        if (percent >= 100) {
          timer!.cancel();
          buttonshow = true;
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: homebackgroundcolor,
      floatingActionButton: buttonshow == true
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  dashBoardRoute,
                  ModalRoute.withName(dashBoardRoute),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                "Start",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: navbarcolor,
            )
          : Container(),
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: navbarcolor,
                    height: screenheight * 0.4,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: navbarcolor,
                  height: (screenheight * 0.4) - 20,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SizedBox(
                child: Image.asset(
                  width: screenwidth,
                  height: screenheight * 0.6,
                  splashscreenimg,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: screenheight * 0.20,
                    width: screenheight * 0.20,
                    child: Center(
                      child: SizedBox(
                        height: screenheight * 0.15,
                        width: screenheight * 0.15,
                        child: Image.asset(
                          splashscreenimg,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: screenheight * 0.3,
                  //   width: screenwidth,
                  //   child: Container(
                  //     margin: const EdgeInsets.symmetric(horizontal: 40),
                  //     child: CircularPercentIndicator(
                  //       radius: 100.0,
                  //       lineWidth: 15.0,
                  //       animation: true,
                  //       animationDuration: 500,
                  //       percent: percent / 100,
                  //       center: Text(
                  //         "$percent%",
                  //         style: const TextStyle(
                  //             fontSize: 20.0,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.black),
                  //       ),
                  //       backgroundColor: Colors.grey,
                  //       circularStrokeCap: CircularStrokeCap.round,
                  //       progressColor: navbarcolor,
                  //     ),
                  //   ),
                  // ),
                  /// changes /////////////////////
                  SizedBox(
                    height: screenheight * 0.10,
                    width: screenwidth,
                    child: LinearPercentIndicator(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      animation: true,
                      animationDuration: 500,
                      lineHeight: 20.0,
                      percent: percent / 100,
                      barRadius: const Radius.circular(20),
                      center: Text(
                        "$percent%",
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: navbarcolor,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.10,
                    width: screenwidth,
                    child: LinearPercentIndicator(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      animation: true,
                      animationDuration: 500,
                      lineHeight: 20.0,
                      percent: percent / 100,
                      barRadius: const Radius.circular(20),
                      center: Text(
                        "$percent%",
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: navbarcolor,
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  SizedBox(
                    height: screenheight * 0.25,
                    width: screenwidth,
                    child: Center(
                        child: Column(
                      children: const [
                        Text(
                          'Home WorkOut',
                          style: TextStyle(
                            fontSize: 28,
                            color: navbarcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'EveryOne Needs A Tune Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: screenheight * 0.05,
                    width: screenwidth,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
