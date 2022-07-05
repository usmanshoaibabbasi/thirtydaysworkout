import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/providers/account_provider.dart';
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
                  passfontsize: 40.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xff003BFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'UNDER',
                  passfontsize: 40.0,
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
                  passfontsize: 36.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xff003BFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'ON A',
                  passfontsize: 36.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 15,
              ),
              accountText(
                  context: context,
                  passtext: 'MISSION',
                  passfontsize: 36.0,
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
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  // minimumSize: const Size(double.infinity, 50),
                ),
                icon: const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
                label: Consumer<GoogleSignInProvider>(
                    builder: (context, value, child) {
                  if (value.loading == false) {
                    return const Text(
                      'Sign In With Google',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    );
                  } else {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.setloading(true);
                  provider.googleLogin().then((value) {
                    provider.setloading(false);
                    if(provider.noaccountselected == false) {
                      Navigator.pushNamed(context, gymProgressRoute);
                    }
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              accountText(
                  context: context,
                  passtext: 'Sign in to save your progress',
                  passfontsize: 16.0,
                  passfontweight: FontWeight.normal,
                  passcolor: const Color(0xffFFFFFF)),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
