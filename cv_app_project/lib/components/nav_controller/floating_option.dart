import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FloatinOptions extends StatelessWidget {
  FloatinOptions({
    super.key,
    required this.text,
    required this.onTap,
  });

  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.065,
        decoration: BoxDecoration(
          color: Color(0xffFFC436),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
