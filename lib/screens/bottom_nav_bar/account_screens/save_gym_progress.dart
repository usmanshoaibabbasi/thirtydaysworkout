import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/widgets/account_widget.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class GymProgress extends StatelessWidget {
  const GymProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splashscreenimg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              /// header
              header(
                context: context,
                navbartxt: "User Gym Progress",
              ),

              Expanded(
                child: Column(
                  children: [
                    /// 1st SizedBox
                    const SizedBox(
                      height: 20,
                    ),
                    accountText(
                        context: context,
                        passtext: 'Save',
                        passfontsize: 36.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                    const SizedBox(
                      height: 15,
                    ),
                    accountText(
                        context: context,
                        passtext: 'OR',
                        passfontsize: 50.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                    const SizedBox(
                      height: 15,
                    ),
                    accountText(
                        context: context,
                        passtext: 'Retreive',
                        passfontsize: 40.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                    const SizedBox(
                      height: 20,
                    ),
                    accountText(
                        context: context,
                        passtext: 'GYM PROGRESS',
                        passfontsize: 36.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                    const SizedBox(
                      height: 20,
                    ),
                    accountText(
                        context: context,
                        passtext: 'Using',
                        passfontsize: 40.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                    const SizedBox(
                      height: 20,
                    ),
                    accountText(
                        context: context,
                        passtext: 'CLOUD STORAGEE',
                        passfontsize: 36.0,
                        passfontweight: FontWeight.normal,
                        passcolor: const Color(0xffFFFFFF)),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, weightLossPlanRoute);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'SAVE Progress',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, weightLossPlanRoute);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      ' GET Progress ',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
