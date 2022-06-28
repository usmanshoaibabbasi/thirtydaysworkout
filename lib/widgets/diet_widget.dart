import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';

Widget dietPlan({
  context,
  passontap,
  passimagepath,
  passtext,
}) {
  final screenwidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: passontap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Image.asset(
              passimagepath,
              height: screenwidth*0.15,
              width: screenwidth*0.15,
            ),
            SizedBox(width: screenwidth*0.08,),
            Expanded(
              child: Text(
                passtext,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  color: lightTextcolor
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}