import 'package:flutter/material.dart';

// this custom widget is title helps my to have same attribute in text widget 

class TitleOfScreen extends StatelessWidget {
  const TitleOfScreen(
      {super.key,
      required this.title,
      required this.titleFontSize,
      required this.titleletterSpacing,
      required this.titlefontWeight,
      required this.titleColor});

  final String title;
  final Color titleColor;
  final double titleFontSize;
  final double titleletterSpacing;
  final FontWeight titlefontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: titleColor,
          fontSize: titleFontSize,
          letterSpacing: titleletterSpacing,
          fontFamily: 'AbrilFatface',
          fontWeight: titlefontWeight),
    );
  }
}
