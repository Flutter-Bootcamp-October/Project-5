import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

Future<dynamic> loading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: mainColor),
          ],
        ),
      );
    },
  );
}
