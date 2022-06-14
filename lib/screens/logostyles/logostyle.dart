import 'package:flutter/material.dart';
import 'package:testing/commonstyle/commonstyles.dart';

class LogoStyle {
  static LogoStyleSet(String text1, text2) {
    return Center(
        child: Column(children: [
      // Image.asset(
      //   "assets/images/maps.png",
      // ),
      SizedBox(
        height: 20,
      ),
      Text(
        "${text1}",
        style: CommonStyle.BlackText18w600(),
      ),
      const SizedBox(height: 20.0),
      Text(
        "${text2}",
        style: CommonStyle.BlackText16w500(),
      ),
    ]));
  }
}
