import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom(
      {super.key,
      required this.color,
      required this.border,
      required this.text,
      required this.ontap});
  final Color color;
  final Function() ontap;
  final Color border;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 350,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border, width: 1),
          color: color,
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
