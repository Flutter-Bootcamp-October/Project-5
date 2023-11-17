import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class TextRich extends StatelessWidget {
  const TextRich({super.key, required this.view, required this.text1, required this.text2});
final Widget view;
final String? text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style:
          const TextStyle(color: Colors.black, fontSize: 16),
          children: [
             TextSpan(text: text1),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        view,
                      )),
                text: text2,
                style: const TextStyle(color: Color(0xffff6700)))
          ],
        ),
      ),
    );
  }
}
