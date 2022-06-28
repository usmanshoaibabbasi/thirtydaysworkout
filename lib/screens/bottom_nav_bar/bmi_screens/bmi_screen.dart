import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/providers/bmi_provider.dart';
import 'package:thirty_days_workout/providers/bottom_nav_provider.dart';
import 'package:thirty_days_workout/widgets/bmi_widgets.dart';
import 'package:thirty_days_workout/widgets/header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

class BMIClass extends StatefulWidget {
  const BMIClass({Key? key}) : super(key: key);

  @override
  State<BMIClass> createState() => _BMIClassState();
}

class _BMIClassState extends State<BMIClass> {
  // bool genderSelected = true;
  // double ageValueg = 20.0;
  var popmenuresult;
  // String weightUnitTkk = 'KG';
  // String heightUnitTkk = 'CM';

  // bool blurr = false;
  double bmicalculated = 0.0;
  String bmicalculated1 = '';
  int weightcalculated = 0;
  String weightcalculated1 = '';
  double fatcalculated = 0.0;
  String fatcalculated1 = '';
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final bmiProvider = Provider.of<BmiProvider>(context, listen: false);
    final bmiAgeProvider = Provider.of<BmiAgeProvider>(context, listen: false);
    final bmiResultInBlurProvider =
        Provider.of<BmiResultInBlurProvider>(context, listen: false);
    final bmiWeightProvider =
        Provider.of<BmiWeightProvider>(context, listen: false);
    final bmiHeightProvider =
        Provider.of<BmiHeightProvider>(context, listen: false);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    // if (kDebugMode) {
    //   print('build all widgets');
    // }
    return Scaffold(
      backgroundColor: homebackgroundcolor,
      body: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                bottomNavProvider.setindex(0);
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                bottomNavProvider.setindex(2);
              }
            },
            child: Column(
              children: [
                /// header
                header(
                  context: context,
                  navbartxt: "BMI",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        /// 1st SizedBox
                        const SizedBox(
                          height: 10,
                        ),

                        /// Male Female Containers Row
                        Row(
                          children: [
                            SizedBox(
                              width: screenwidth * 0.02,
                            ),

                            /// 1st container
                            Consumer<BmiProvider>(
                                builder: (context, value, child) {
                              if (kDebugMode) {
                                print('build only Male');
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (value.genderSelected == false) {
                                    value.setgenderSelected(true);
                                  }
                                  // if (genderSelected == false) {
                                  //   setState(() {
                                  //     genderSelected = true;
                                  //   });
                                  // }
                                },
                                child: maleFemaleContainer(
                                  context: context,
                                  containercolor: value.genderSelected == true
                                      ? navbarcolor
                                      : Colors.transparent,
                                  iconpass: FontAwesomeIcons.venus,
                                  textpass: 'Male',
                                ),
                              );
                            }),
                            SizedBox(
                              width: screenwidth * 0.06,
                            ),

                            /// 2nd Container
                            Consumer<BmiProvider>(
                                builder: (context, value, child) {
                              if (kDebugMode) {
                                print('build only Female');
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (value.genderSelected == true) {
                                    value.setgenderSelected(false);
                                  }
                                  // if (genderSelected == true) {
                                  //   setState(() {
                                  //     genderSelected = false;
                                  //   });
                                  // }
                                },
                                child: maleFemaleContainer(
                                  context: context,
                                  containercolor: value.genderSelected == false
                                      ? navbarcolor
                                      : Colors.transparent,
                                  iconpass: FontAwesomeIcons.mars,
                                  textpass: 'Female',
                                ),
                              );
                            }),
                            SizedBox(
                              width: screenwidth * 0.02,
                            ),
                          ],
                        ),

                        /// 2nd SizedBox
                        const SizedBox(
                          height: 10,
                        ),

                        /// Age Slider Container
                        Container(
                          height: 170,
                          width: screenwidth,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(
                              color: navbarcolor,
                              width: 3.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        if (bmiAgeProvider.ageValue > 1) {
                                          bmiAgeProvider.incdecage(true);
                                        }
                                        // if (ageValue > 1) {
                                        //   setState(() {
                                        //     ageValue = ageValue - 1;
                                        //   });
                                        // }
                                      },
                                      child: pusMinusbtn(
                                          context: context,
                                          iconpass: FontAwesomeIcons.minus)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    'AGE (YEARS)',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (bmiAgeProvider.ageValue < 99) {
                                          bmiAgeProvider.incdecage(false);
                                        }
                                        // if (ageValue < 99) {
                                        //   setState(() {
                                        //     ageValue = ageValue + 1;
                                        //   });
                                        // }
                                      },
                                      child: pusMinusbtn(
                                          context: context,
                                          iconpass: FontAwesomeIcons.plus)),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Consumer<BmiAgeProvider>(
                                  builder: (context, value, child) {
                                if (kDebugMode) {
                                  print('build only text');
                                }
                                return Text(
                                  value.ageValue.toString().substring(
                                        0,
                                        value.ageValue.toString().indexOf('.'),
                                      ),
                                  // ageValue.toString().substring(
                                  //     0, ageValue.toString().indexOf('.')),
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }),
                              Consumer<BmiAgeProvider>(
                                  builder: (context, valuebyprovider, child) {
                                if (kDebugMode) {
                                  print('slider build');
                                }
                                return Slider(
                                  value: valuebyprovider.ageValue,
                                  min: 1.0,
                                  max: 100.0,
                                  divisions: 100,
                                  activeColor: navbarcolor,
                                  label: '${valuebyprovider.ageValue.round()}',
                                  onChanged: (double val) {
                                    bmiAgeProvider.sliderval(val);
                                    // setState(() {
                                    //   ageValue = value;
                                    // });
                                  },
                                );
                              }),
                            ],
                          ),
                        ),

                        /// 3rd SizedBox
                        const SizedBox(
                          height: 10,
                        ),

                        /// Weight Height Containers Row
                        Row(
                          children: [
                            SizedBox(
                              width: screenwidth * 0.02,
                            ),
                            Consumer<BmiWeightProvider>(
                                builder: (context, value, child) {
                              if (kDebugMode) {
                                print('build only Weight');
                              }
                              return heightWeightContainer(
                                context: context,
                                kGCMtext: value.weightUnit,
                                passonSelected: (newValue) {
                                  popmenuresult = newValue;
                                  if (popmenuresult == 0) {
                                    value.setWeight('KG');
                                  }
                                  if (popmenuresult == 1) {
                                    value.setWeight('Pound');
                                  }

                                  ///
                                  // setState(() {
                                  //   popmenuresult = newValue;
                                  //   if (popmenuresult == 0) {
                                  //     weightUnit = 'KG';
                                  //   }
                                  //   if (popmenuresult == 1) {
                                  //     weightUnit = 'Pound';
                                  //   }
                                  //   // it gives the value which is selected
                                  // });
                                },
                                popmenutext1: 'KG',
                                popmenutext2: 'Pound',
                                weightHeighttxt: 'Weight',
                                passcontroller: weightcontroller,
                                labeltextpass: 'Your Weight',
                                passTextInputAction: TextInputAction.next,
                              );
                            }),
                            SizedBox(
                              width: screenwidth * 0.06,
                            ),
                            Consumer<BmiHeightProvider>(
                                builder: (context, value, child) {
                              if (kDebugMode) {
                                print('build only Height');
                              }
                              return heightWeightContainer(
                                context: context,
                                kGCMtext: value.heightUnit,
                                passonSelected: (newValue) {
                                  popmenuresult = newValue;
                                  if (popmenuresult == 0) {
                                    value.setHeight('CM');
                                  }
                                  if (popmenuresult == 1) {
                                    value.setHeight('Inches');
                                  }
                                  // setState(() {
                                  //   popmenuresult = newValue;
                                  //   if (popmenuresult == 0) {
                                  //     heightUnit = 'CM';
                                  //   }
                                  //   if (popmenuresult == 1) {
                                  //     heightUnit = 'Inches';
                                  //   }
                                  //   // it gives the value which is selected
                                  // });
                                },
                                popmenutext1: 'CM',
                                popmenutext2: 'Inches',
                                weightHeighttxt: 'Height',
                                passcontroller: heightcontroller,
                                labeltextpass: 'Your Height',
                                passTextInputAction: TextInputAction.done,
                              );
                            }),
                            SizedBox(
                              width: screenwidth * 0.02,
                            ),
                          ],
                        ),

                        /// 4th SizedBox
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (validData(context)) {
                              heightWeightConvert(
                                context,
                                bmiProvider.genderSelected,
                                bmiAgeProvider.ageValue,
                                bmiWeightProvider.weightUnit,
                                bmiHeightProvider.heightUnit,
                              );
                              bmiResultInBlurProvider.setblur(true);
                            }

                            ///
                            // setState(() {
                            //   if (validData(context)) {
                            //     heightWeightConvert(
                            //       context,
                            //       bmiProvider.genderSelected,
                            //       bmiAgeProvider.ageValue,
                            //     );
                            //     blurr = true;
                            //   }
                            // });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            width: screenwidth,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: navbarcolor,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Center(
                                child: Text(
                                  'CALCULATE',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// 4th SizedBox
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<BmiResultInBlurProvider>(builder: (context, value, child) {
            if (kDebugMode) {
              print('only stack build');
            }
            return value.blur == true
                ? SizedBox(
                    width: screenwidth,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        generateBluredImage(
                          context: context,
                        ),
                        rectShapeContainer(
                          context: context,
                          ontapcross: () {
                            heightcontroller.clear();
                            weightcontroller.clear();
                            bmiResultInBlurProvider.setblur(false);

                            ///
                            // setState(() {
                            //   heightcontroller.clear();
                            //   weightcontroller.clear();
                            //   blurr = false;
                            // });
                          },
                          passtextbmi: bmicalculated1.toString(),
                          passtextidealweight: '$weightcalculated1 kg',
                          passtextFat: '$fatcalculated1 %',
                        ),
                      ],
                    ),
                  )
                : Container();
          })
        ],
      ),
    );
  }

  bool validData(context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (heightcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Enter a valid height'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ));
      return false;
    }
    if (weightcontroller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Enter a valid weight'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ));
      return false;
    }
    return true;
  }

  void heightWeightConvert(
    BuildContext context,
    bool genderSelected,
    double ageValue,
    String weightUnit,
    String heightUnit,
  ) {
    String stringHeight = heightcontroller.text.trim();
    double doubleheight = double.parse(stringHeight);
    String stringWeight = weightcontroller.text.trim();
    double doubleWeight = double.parse(stringWeight);

    ///
    calculateBmi(
      context,
      doubleheight,
      doubleWeight,
      genderSelected,
      ageValue,
      weightUnit,
      heightUnit,
    );
  }

  void calculateBmi(
    BuildContext context,
    double doubleHeight,
    double doubleWeight,
    bool genderSelected,
    double ageValue,
    String weightUnit,
    String heightUnit,
  ) {
    double valueforFat = 0.0;
    double heightForIdealWeight = doubleHeight;
    double genderWeight = 0.0;
    double fixValue = 0.0;
    // print('print height');
    // print(doubleHeight);
    // print('print weight');
    // print(doubleWeight);
    // print('printed both');
    // print(weightUnit);
    // print(heightUnit);
    if (weightUnit == 'Pound') {
      doubleWeight = doubleWeight / 2.204623;
      // print('print weight pound');
      // print(doubleWeight);
    }
    if (heightUnit == 'CM') {
      doubleHeight = doubleHeight / 100;
      // print('print height convert from CM');
      // print(doubleWeight);
    }
    if (heightUnit == 'Inches') {
      doubleHeight = doubleHeight / 39.37008;
      // print('print height convert from Inches');
      // print(doubleWeight);
    }

    var bmi = (doubleWeight / pow(doubleHeight, 2) * 10);
    // print('bmi double');
    // print(bmi);
    bmicalculated = (bmi.round()) / 10.0;
    // print('bmi int');
    // print(bmicalculated);
    bmicalculated1 = bmicalculated.toString();

    ///
    /// Fat Calculation
    if (genderSelected == true) {
      valueforFat = 16.2;
    } else if (genderSelected == false) {
      valueforFat = 5.4;
    }
    // print(valueforFat);
    fatcalculated =
        (((1.20 * bmicalculated) + (0.23 * ageValue)) - valueforFat);
    // print(fatcalculated);
    fatcalculated1 = fatcalculated.toStringAsFixed(0);

    ///
    /// Ideal Weight Calculation
    if (heightUnit == 'CM') {
      heightForIdealWeight = (heightForIdealWeight / 2.54) / 12;
      heightForIdealWeight = heightForIdealWeight - 5;
      heightForIdealWeight = heightForIdealWeight * 12;
      print('in cm');
      print(heightForIdealWeight);
    } else if (heightUnit == 'Inches') {
      heightForIdealWeight = heightForIdealWeight / 12;
      heightForIdealWeight = heightForIdealWeight - 5;
      heightForIdealWeight = heightForIdealWeight * 2.54;
      print(heightForIdealWeight);
    }
    if (genderSelected == true) {
      genderWeight = 56.2;
      fixValue = 1.41;
    } else if (genderSelected == false) {
      genderWeight = 53.1;
      fixValue = 1.36;
    }
    weightcalculated = (genderWeight + fixValue * heightForIdealWeight).round();
    weightcalculated1 = weightcalculated.toString();
  }
}
