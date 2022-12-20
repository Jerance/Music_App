import 'package:flutter/material.dart';
import 'package:music_app/assets/theme/colors.dart';

ButtonStyle btnSignUp = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(gold),
    fixedSize: MaterialStateProperty.all(const Size(250, 45)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    )));

ButtonStyle btnLogin = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(mainColorDark),
    fixedSize: MaterialStateProperty.all(const Size(250, 45)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: gold, width: 3))));
