import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)]
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const KAnimationDuration = Duration(microseconds: 200);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9.]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter a valid Email";
const String kPasswordNullError = "Please Enter your password";
const String kShortPasswordError = "Password is too short";
const String kMatchPasswordError = "Passwords don't match";