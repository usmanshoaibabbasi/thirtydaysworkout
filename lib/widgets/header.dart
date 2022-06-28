import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';

Widget header({
  context,
  navbartxt
}) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      color: navbarcolor,
    ),
    child: Center(
      child: Text(
        navbartxt,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white
        ),
      ),
    ),
  );
}

Widget everyDayExerciseheader({
  context,
  navbar1sttxt,
  navbar2ndtxt,
}) {
  return Container(
    height: 60,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      color: navbarcolor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          navbar1sttxt,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
        Text(
          navbar2ndtxt,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
        ),
      ],
    ),
  );
}