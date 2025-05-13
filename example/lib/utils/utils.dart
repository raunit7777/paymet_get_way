import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // ✅ Required import

import '../res/const_color.dart';

class Utils {
  /// Shows a toast message with customizable options
  static void toastMessage(
      String message, {
        ToastGravity gravity = ToastGravity.BOTTOM,
        Color backgroundColor = AppColor.kSelectItemColor,
        Color textColor = Colors.white,
        double fontSize = 16.0,
        Toast toastLength = Toast.LENGTH_LONG,
      }) {
    if (message.isEmpty) return;
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}
