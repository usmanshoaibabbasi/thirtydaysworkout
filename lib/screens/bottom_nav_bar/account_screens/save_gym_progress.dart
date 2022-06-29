import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/modals/gym_exercises_modal.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/providers/gym_exercises_provider.dart';
import 'package:thirty_days_workout/widgets/header.dart';

class GymProgress extends StatelessWidget {
  GymProgress({Key? key}) : super(key: key);

  var gymprogr;
  @override
  Widget build(BuildContext context) {
    final screenheight = (MediaQuery.of(context).size.height) - 60;
    final safeAreaheight = MediaQuery.of(context).padding.top;
    final user = FirebaseAuth.instance.currentUser;
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              header(
                context: context,
                navbartxt: "Save Gym Progress",
              ),
              StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: screenheight - safeAreaheight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'PROFILE',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(user!.photoURL as String),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Name: ${user.displayName}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Email: ${user.email}',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    ///
                                    getGymExercisesFullList(context)
                                        .then((value) {
                                      final provider =
                                          Provider.of<GymExercisesFullProvider>(
                                              context,
                                              listen: false);
                                      if (provider
                                              .gymExercisesFullList[0].status ==
                                          2) {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              const Text('No Progress To Save'),
                                          duration: const Duration(seconds: 1),
                                          action: SnackBarAction(
                                            label: 'Dismiss',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentMaterialBanner();
                                            },
                                          ),
                                        ));
                                      } else {
                                        provider.setloading(true);
                                        int exerciseprogress = 0;
                                        while (exerciseprogress <
                                                provider.gymExercisesFullList
                                                    .length &&
                                            (provider
                                                        .gymExercisesFullList[
                                                            exerciseprogress]
                                                        .status ==
                                                    1 ||
                                                provider
                                                        .gymExercisesFullList[
                                                            exerciseprogress]
                                                        .status ==
                                                    2)) {
                                          exerciseprogress =
                                              exerciseprogress + 1;
                                        }
                                        if (kDebugMode) {
                                          print(exerciseprogress.toString());
                                        }
                                        saveGymdata(
                                            username:
                                                user.displayName as String,
                                            useremail: user.email as String,
                                            exerciseprogress: exerciseprogress);
                                        provider.setloading(false);
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              const Text('Your Progress Saved'),
                                          duration: const Duration(seconds: 1),
                                          action: SnackBarAction(
                                            label: 'Dismiss',
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentMaterialBanner();
                                            },
                                          ),
                                        ));
                                      }
                                    });
                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: Text(
                                        'SAVE Progress',
                                        style: TextStyle(fontSize: 16),
                                      ))),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    int statusupdate = 1;
                                    final provider =
                                        Provider.of<GymExercisesFullProvider>(
                                            context,
                                            listen: false);
                                    provider.setloading(true);

                                    ///
                                    readGymProgress(
                                      useremail: user.email as String,
                                    )
                                        .then((value) => {
                                              for (int i = 0; i < gymprogr; i++)
                                                {
                                                  updateExerciseStatus(
                                                    context,
                                                    i,
                                                    statusupdate,
                                                  )
                                                }
                                            })
                                        .then((value) => {
                                              provider.setloading(false),
                                              ScaffoldMessenger.of(context)
                                                  .hideCurrentSnackBar(),
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: const Text(
                                                    'Your Progress Fetched'),
                                                duration:
                                                    const Duration(seconds: 1),
                                                action: SnackBarAction(
                                                  label: 'Dismiss',
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentMaterialBanner();
                                                  },
                                                ),
                                              )),
                                            })
                                        .then((value) => {
                                              Navigator.pop(context),
                                              // bottomNavProvider.setindex(0),
                                              // Navigator.pushNamedAndRemoveUntil(
                                              //   context,
                                              //   dashBoardRoute,
                                              //   ModalRoute.withName(
                                              //       dashBoardRoute),
                                              // )
                                            });

                                    ///
                                  },
                                  child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: Text(
                                        ' GET Progress ',
                                        style: TextStyle(fontSize: 16),
                                      ))),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something Went Wrong!'),
                    );
                  } else {
                    return const Center(
                      child: Text('Something Went Wrong!'),
                    );
                  }
                },
              ),
            ],
          ),
          Consumer<GymExercisesFullProvider>(builder: (context, value, child) {
            if (value.loading == false) {
              return Container();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ],
      )),
    );
  }

  Future getGymExercisesFullList(context) async {
    // if(kDebugMode) {
    //   print('Enter in getGymExercisesFullList');
    // }
    final homeProvider =
        Provider.of<GymExercisesFullProvider>(context, listen: false);
    var dbHelper = DBHelper();
    List<gymExercisesModal> gymExercisesFullList =
        await dbHelper.getGymExercisesFullList();
    homeProvider.setgymExercisesFullList(gymExercisesFullList);
  }

  Future saveGymdata(
      {required String username,
      required String useremail,
      required int exerciseprogress}) async {
    final docgymexercise = FirebaseFirestore.instance
        .collection('exerciseprogress')
        .doc(useremail);
    final json = {
      'username': username,
      'useremail': useremail,
      'exerciseprogress': exerciseprogress,
      'updatetime': DateTime.now(),
    };
    await docgymexercise.set(json);
  }

  Future readGymProgress({
    required String useremail,
  }) async {
    final docgymexercise = FirebaseFirestore.instance
        .collection('exerciseprogress')
        .doc(useremail);
    final snapshot = await docgymexercise.get();

    if (snapshot.exists) {
      gymprogr = snapshot.data()!['exerciseprogress'];
      if (kDebugMode) {
        print(snapshot.data()!['exerciseprogress']);
      }
      return snapshot.data();
    }
  }

  Future updateExerciseStatus(
      BuildContext context, int id, int statusupdate) async {
    var dbHelper = DBHelper();
    var update = await dbHelper.updateExerciseStatus(id, statusupdate);
  }
}
