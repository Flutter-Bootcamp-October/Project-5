import 'package:cv/constants/sizes.dart';
import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({super.key, required this.title, required this.Subtitle});

  final String title;
  final String Subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      height10,
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          Subtitle,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ),
    ]);
  }
}
