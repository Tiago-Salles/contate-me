import 'package:flutter/material.dart';

class SnackBarHelper {
  static showSnackBar(BuildContext context, String? message,
      {Color? backgroundColor, Color? textColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: backgroundColor,
        content: Text(
          "$message",
          style: TextStyle(
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
