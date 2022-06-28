import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/widgets/account_widget.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(accountscreenbgimage),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onPanUpdate: (details) {
            // Swiping in right direction.
            if (details.delta.dx > 0) {
              bottomNavProvider.setindex(3);
            }

            // // Swiping in left direction.
            // if (details.delta.dx < 0) {
            //   bottomNavProvider.setindex(4);
            // }
          },
          child: Column(
            children: [
              /// header
              header(
                context: context,
                navbartxt: "User Account",
              ),

              /// 1st SizedBox
              const SizedBox(
                height: 20,
              ),
              accountText(
                  context: context,
                  passtext: 'BODY',
                  passfontsize: 50.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xff003BFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'UNDER',
                  passfontsize: 50.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'CONSTRUCTION',
                  passfontsize: 22.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'MIND',
                  passfontsize: 46.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xff003BFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'ON A',
                  passfontsize: 46.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'MISSION',
                  passfontsize: 46.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                accountscreenimage1,
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, gymProgressRoute);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              accountText(
                  context: context,
                  passtext: 'Sign in to save your progress',
                  passfontsize: 16.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
            ],
          ),
        ),
      ),
    );
  }
}
