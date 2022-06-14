import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:testing/commonstyle/constrants.dart';

class CommonStyle {
  // ignore: non_constant_identifier_names
  static BlackText18w600() {
    return const TextStyle(
      fontSize: 18,
      fontFamily: "Jost",
      fontWeight: FontWeight.w600,
      color: blackColor,
    );
  }

  static BlackText14w400() {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Jost",
      fontWeight: FontWeight.w400,
      color: blackColor,
    );
  }

  static BlackText16w500() {
    return const TextStyle(
      fontSize: 16,
      fontFamily: "Jost",
      fontWeight: FontWeight.w500,
      color: blackColor,
    );
  }

  static WhiteText14w500() {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Jost",
      fontWeight: FontWeight.w500,
      color: whiteColor,
    );
  }
}
