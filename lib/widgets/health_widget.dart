import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thirty_days_workout/data/image_paths.dart';

Widget healthtipContainer({
  context,
  passimagepath,
  passtext,
}) {
  final screenwidth = MediaQuery.of(context).size.width;
  return Container(
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
      width: screenwidth*0.40,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Image.asset(
            passimagepath,
            height: screenwidth*0.19,
            width: screenwidth*0.19,
          ),
          const SizedBox(height: 10,),
          Text(
            passtext,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
            ),
          ),
        ],
      ),
    ),
  );
}