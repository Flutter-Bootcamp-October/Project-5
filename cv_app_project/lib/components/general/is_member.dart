import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IsMember extends StatelessWidget {
  IsMember(
      {super.key,
      required this.leftText,
      required this.rightText,
      required this.ontap});
  String leftText;
  String rightText;
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$leftText',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        InkWell(
          onTap: ontap,
          child: Text(
            '$rightText',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0C356A),
            ),
          ),
        ),
      ],
    );
  }
}
