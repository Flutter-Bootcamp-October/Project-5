import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextCustom extends StatelessWidget {
  const RichTextCustom({
    super.key,
    required this.text1,
    required this.text2,
    required this.screen,
  });
  final String text1;
  final String text2;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
              text: text2,
              style: const TextStyle(color: Color(0xff1e3867)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => screen),
                      ModalRoute.withName("/screen"));
                })
        ],
      ),
    );
  }
}
