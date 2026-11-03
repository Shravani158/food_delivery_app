// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:food_delivery_app/app/utils/constants/colors/Ucolors.dart';

class Utextstyles {
  Utextstyles._();

  static const String _fontFamily = 'OpenSans';
  static const double _lineHeight = 1.31;

  static const TextStyle onboardingTitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w800,
    height: _lineHeight,
    letterSpacing: 0,
    color: Ucolors.textColor,
  );

  static const TextStyle loginSubtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: _lineHeight,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: _lineHeight,
    letterSpacing: 0,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle forgetPassword = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle orDivider = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    color: Ucolors.primary,
  );

  static const TextStyle authPrompt = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle authAction = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    color: Ucolors.primary,
    fontWeight: FontWeight.w800,
  );
}
