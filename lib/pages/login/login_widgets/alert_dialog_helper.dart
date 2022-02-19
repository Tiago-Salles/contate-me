import 'package:flutter/material.dart';

class AlertDialogHelper {
  static showMyDialog(BuildContext context, String? message, Color? textColor,
      {List<Widget>? actions}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "$message",
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: actions,
        );
      },
    );
  }
}
