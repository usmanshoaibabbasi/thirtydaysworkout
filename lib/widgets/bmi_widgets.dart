import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/data/image_paths.dart';

Widget maleFemaleContainer({
  context,
  containercolor,
  iconpass,
  textpass,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    height: 140,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: containercolor,
      border: Border.all(
        color: navbarcolor,
        width: 3.0,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Icon(
              iconpass,
              size: 60,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                textpass,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget pusMinusbtn({context, iconpass}) {
  return Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(200),
      color: navbarcolor,
    ),
    child: Icon(
      iconpass,
      color: Colors.white,
    ),
  );
}

Widget heightWeightContainer({
  context,
  kGCMtext,
  passonSelected,
  popmenutext1,
  popmenutext2,
  weightHeighttxt,
  passcontroller,
  labeltextpass,
  passTextInputAction,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.45,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      // color: navbarcolor,
      border: Border.all(
        color: navbarcolor,
        width: 3.0,
      ),
    ),
    child: Column(
      children: [
        Container(
          color: navbarcolor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    kGCMtext,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  )),
              // GestureDetector(
              //   onTap: iconontappass,
              //   child: Icon(
              //     FontAwesomeIcons.caretDown,
              //     size: 30,
              //     color: Colors.white,
              //   ),
              // ),
              PopupMenuButton(
                icon: const Icon(
                  FontAwesomeIcons.caretDown,
                  size: 30,
                  color: Colors.white,
                ),
                onSelected: passonSelected,
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 0,
                    child: Text(popmenutext1),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(popmenutext2),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          height: 114,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                weightHeighttxt,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 20),
              ),
              TextFormField(
                controller: passcontroller,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                textInputAction: passTextInputAction,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    label: Center(
                      child: Text(
                        labeltextpass,
                        style: const TextStyle(fontSize: 20),
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget generateBluredImage({context}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          bmiscreenimage,
        ),
        fit: BoxFit.cover,
      ),
    ),
    //I blured the parent container to blur background image, you can get rid of this part
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
      child: Container(
        //you can change opacity with color here(I used black) for background.
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
      ),
    ),
  );
}

Widget rectShapeContainer(
    {context, ontapcross, passtextbmi, passtextidealweight, passtextFat}) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(
      horizontal: 15.0,
    ),
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      //you can get rid of below line also
      borderRadius: BorderRadius.circular(10.0),
      //below line is for rectangular shape
      shape: BoxShape.rectangle,
      //you can change opacity with color here(I used black) for rect
      color: Colors.black.withOpacity(0.5),
      //I added some shadow, but you can remove boxShadow also.
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5.0,
          offset: Offset(5.0, 5.0),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.fromLTRB(7.5, 60, 7.5, 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        decoration: BoxDecoration(
                          color: navbarcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'BMI',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        decoration: BoxDecoration(
                          color: navbarcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'IDEAL WEIGHT',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      Container(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        decoration: BoxDecoration(
                          color: navbarcolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'FAT',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              passtextbmi.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      SizedBox(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              passtextidealweight,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      SizedBox(
                        height: 70,
                        width:
                            (MediaQuery.of(context).size.width * 0.3333) - 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              passtextFat,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ontapcross,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 10),
                    child: const Icon(
                      FontAwesomeIcons.circleXmark,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
