import 'package:flutter/material.dart';

Widget accountText({
  context,
  passtext,
  passfontsize,
  passfontweight,
  passcolor
}) {
  return Text(
    passtext,
    style: TextStyle(
      fontSize: passfontsize,
      fontWeight: passfontweight,
      color: passcolor,
    ),
  );
}