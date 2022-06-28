import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';
import 'package:thirty_days_workout/helpers/db_helper.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/modals/home_screen_modals.dart';
import 'package:thirty_days_workout/providers/home_everyday_provider.dart';

class HomeEveryDayExerciseCard extends StatefulWidget {
  final everyDayExerciseModal indexofEveryDayExercise;
  final int lastindex;
  final int firstindex;
  final int index;
  const HomeEveryDayExerciseCard({
    Key? key,
    required this.indexofEveryDayExercise,
    required this.lastindex,
    required this.firstindex,
    required this.index,
  }) : super(key: key);

  @override
  State<HomeEveryDayExerciseCard> createState() =>
      _HomeEveryDayExerciseCardState();
}

class _HomeEveryDayExerciseCardState extends State<HomeEveryDayExerciseCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    int indexhere = widget.index - 1;
    int oneOfLength = widget.index;
    final homeEveryDayProvider =
        Provider.of<HomeEveryDayProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {}

        ///
        showdialoghere(homeEveryDayProvider, indexhere, oneOfLength);

        ///
      },
      child: Container(
        margin: homeEveryDayProvider.everyday_Exercise_List[indexhere].id ==
                widget.firstindex + widget.lastindex
            ? const EdgeInsets.fromLTRB(10, 15, 10, 20)
            : const EdgeInsets.fromLTRB(10, 15, 10, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 9.0,
            ),
          ],
        ),
        child: Container(
          width: screenwidth,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeEveryDayProvider
                          .everyday_Exercise_List[indexhere].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: dietplandayslisttextcolor),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      homeEveryDayProvider
                          .everyday_Exercise_List[indexhere].counts,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: dietplandayslisttextcolor),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Image.asset(
                      homeEveryDayProvider.exercisecomplletionlist[indexhere] ==
                              1
                          ? trophy
                          : trophyGRAY,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    // Text(
                    //     'Status ${homeEveryDayProvider.everyday_Exercise_List[indexhere].status.toString()}'),
                    // const SizedBox(
                    //   height: 3,
                    // ),
                    // Text('IndexNumber ${indexhere.toString()}'),
                    // Text(
                    //     'ID ${homeEveryDayProvider.everyday_Exercise_List[indexhere].id.toString()}'),
                  ],
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  'assets${homeEveryDayProvider.everyday_Exercise_List[indexhere].gif.toString().substring(8, homeEveryDayProvider.everyday_Exercise_List[indexhere].gif.toString().length)}',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future showdialoghere(homeEveryDayProvider, indexhere, oneOfLength) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black38,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          insetPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          // contentPadding: const EdgeInsets.fromLTRB(13, 15, 13, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 1st sizedBox
                const SizedBox(
                  height: 5,
                ),

                /// Image of Exercise
                Center(
                  child: ClipRRect(
                    child: Image.asset(
                      'assets${homeEveryDayProvider.everyday_Exercise_List[indexhere].gif.toString().substring(8, homeEveryDayProvider.everyday_Exercise_List[indexhere].gif.toString().length)}',
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                /// 2nd SizedBox
                const SizedBox(
                  height: 7,
                ),

                /// Title Text
                Center(
                  child: Text(
                    homeEveryDayProvider.everyday_Exercise_List[indexhere].title
                        .toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: navbarcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// 3rd SizedBox
                const SizedBox(
                  height: 8,
                ),

                /// Description Text
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                          scrollbarTheme: ScrollbarThemeData(
                              thumbColor:
                                  MaterialStateProperty.all(navbarcolor),
                              mainAxisMargin: 8,
                              crossAxisMargin: 2)),
                      child: Scrollbar(
                        radius: const Radius.circular(10),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                            child: Text(
                              homeEveryDayProvider
                                  .everyday_Exercise_List[indexhere].description
                                  .toString()
                                  .trim()
                                  .replaceAll('<br />', ''),
                              style: const TextStyle(
                                  height: 1.3,
                                  fontSize: 18,
                                  color: Color(0xff757575)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// 4th SizedBox
                const SizedBox(
                  height: 5,
                ),

                /// Row of Icons
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (oneOfLength > 1) {
                            setState(() {
                              Navigator.pop(context);
                              indexhere = indexhere - 1;
                              oneOfLength = oneOfLength - 1;
                              showdialoghere(
                                  homeEveryDayProvider, indexhere, oneOfLength);
                            });
                          } else if (oneOfLength == 1) {
                            setState(() {
                              Navigator.pop(context);
                              indexhere = homeEveryDayProvider
                                      .everyday_Exercise_List.length -
                                  1;
                              oneOfLength = homeEveryDayProvider
                                  .everyday_Exercise_List.length;
                              showdialoghere(
                                  homeEveryDayProvider, indexhere, oneOfLength);
                            });
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Icon(
                            CupertinoIcons.chevron_back,
                            size: 30,
                            color: navbarcolor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${oneOfLength.toString()}/',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: navbarcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${homeEveryDayProvider.everyday_Exercise_List.length}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: navbarcolor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          if (oneOfLength <
                              homeEveryDayProvider
                                  .everyday_Exercise_List.length) {
                            setState(() {
                              Navigator.pop(context);
                              indexhere = indexhere + 1;
                              oneOfLength = oneOfLength + 1;
                              showdialoghere(
                                  homeEveryDayProvider, indexhere, oneOfLength);
                            });
                          } else if (oneOfLength ==
                              homeEveryDayProvider
                                  .everyday_Exercise_List.length) {
                            setState(() {
                              Navigator.pop(context);
                              indexhere = 0;
                              oneOfLength = 1;
                              showdialoghere(
                                  homeEveryDayProvider, indexhere, oneOfLength);
                            });
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                          child: Icon(
                            CupertinoIcons.chevron_forward,
                            size: 30,
                            color: navbarcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Last Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            homeEveryDayYoutubeVideoRoute,
                            arguments: {
                              'videoLink': homeEveryDayProvider
                                  .everyday_Exercise_List[indexhere].link
                                  .toString(),
                              'title': homeEveryDayProvider
                                  .everyday_Exercise_List[indexhere].title
                                  .toString(),
                              'description': homeEveryDayProvider
                                  .everyday_Exercise_List[indexhere].description
                                  .toString()
                                  .trim()
                                  .replaceAll('<br />', ''),
                            },
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: navbarcolor,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.play,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (homeEveryDayProvider
                                  .exercisecomplletionlist[indexhere] ==
                              1) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Exercise already completed'),
                              duration: const Duration(milliseconds: 600),
                              action: SnackBarAction(
                                label: 'Dismiss',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentMaterialBanner();
                                },
                              ),
                            ));
                          } else {
                            if (indexhere != 0 &&
                                homeEveryDayProvider.exercisecomplletionlist[
                                        indexhere - 1] ==
                                    0) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text(
                                    'complete previous Exercise first'),
                                duration: const Duration(milliseconds: 600),
                                action: SnackBarAction(
                                  label: 'Dismiss',
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentMaterialBanner();
                                  },
                                ),
                              ));
                            } else {
                              if (indexhere + 1 ==
                                  homeEveryDayProvider
                                      .everyday_Exercise_List.length) {
                                int statusupdate = 1;
                                updateExerciseStatus(
                                  context,
                                  homeEveryDayProvider
                                      .everyday_Exercise_List[indexhere].id,
                                  statusupdate,
                                ).then(((value) {
                                  return setState(() {
                                    int a = homeEveryDayProvider
                                        .everyday_Exercise_List.length;
                                    int valOfB = indexhere + 1;
                                    homeEveryDayProvider.addListToValues(
                                        a, true, valOfB);
                                    Navigator.pop(context);
                                    showdialoghere(homeEveryDayProvider,
                                        indexhere, oneOfLength);
                                  });
                                })).then(((value) {
                                  int statusupdate = 2;
                                  return updateExerciseStatus(
                                    context,
                                    homeEveryDayProvider
                                            .everyday_Exercise_List[indexhere]
                                            .id +
                                        1,
                                    statusupdate,
                                  );
                                }));
                              } else {
                                
                                int statusupdate = 1;
                                updateExerciseStatus(
                                  context,
                                  homeEveryDayProvider
                                      .everyday_Exercise_List[indexhere].id,
                                  statusupdate,
                                ).then(((value) {
                                  return setState(() {
                                    int a = homeEveryDayProvider
                                        .everyday_Exercise_List.length;
                                    int valOfB = indexhere + 1;
                                    homeEveryDayProvider.addListToValues(
                                        a, true, valOfB);
                                    Navigator.pop(context);
                                    showdialoghere(homeEveryDayProvider,
                                        indexhere, oneOfLength);
                                  });
                                }));
                              }
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            color: homeEveryDayProvider
                                        .exercisecomplletionlist[indexhere] ==
                                    1
                                ? Colors.green
                                : Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.check,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: const <Widget>[],
        );
      },
    );
  }

  Future updateExerciseStatus(
      BuildContext context, int id, int statusupdate) async {
    var dbHelper = DBHelper();
    var update = await dbHelper.updateExerciseStatus(id, statusupdate);
    if (kDebugMode) {
      print(update);
    }
  }
}
