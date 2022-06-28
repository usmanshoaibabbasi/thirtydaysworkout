import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

Widget animatedListvieweffects({context}) {
  return AnimationLimiter(
    child: ListView.builder(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 30),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          delay: const Duration(milliseconds: 100),
          child: SlideAnimation(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            horizontalOffset: -300,
            verticalOffset: -850,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 20),
              height: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
