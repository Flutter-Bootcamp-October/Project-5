import 'package:cv_application_api/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key, required this.textButtom, required this.onPressed});

  final String textButtom;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: app2DarkGreenTrans),
        child: Center(
            child: Text(
          textButtom,
          style: const TextStyle(color: appWhite, letterSpacing: 2),
        )),
      ),
    );
  }
}
