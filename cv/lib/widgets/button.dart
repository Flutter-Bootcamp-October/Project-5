import 'package:flutter/material.dart';

class Appbutton extends StatelessWidget {
  const Appbutton(
      {super.key,
      required this.onpressed,
      required this.title,
      required this.titleColor,
      required this.btnColor});

  final Function() onpressed;
  final Color btnColor;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 22),
      child: SizedBox(
        height: 56,
        width: 354,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: titleColor),
          ),
        ),
      ),
    );
  }
}
