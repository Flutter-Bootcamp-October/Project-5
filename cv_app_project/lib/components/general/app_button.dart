import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton({super.key, required this.text, required this.onTap});
  String text;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          color: Color(0xffFFC436),
          child: Center(
            child: Text(
              '$text'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
