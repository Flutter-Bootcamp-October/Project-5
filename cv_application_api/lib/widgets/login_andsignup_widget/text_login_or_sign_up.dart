import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title.dart';
import 'package:flutter/material.dart';

class TextLoginorSignUP extends StatelessWidget {
  const TextLoginorSignUP(
      {super.key,
      required this.titleTest,
      required this.titleButtom,
      required this.onPressed});
  final String titleTest;
  final String titleButtom;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleOfScreen(
          title: titleTest,
          titleFontSize: 20,
          titleletterSpacing: 0,
          titlefontWeight: FontWeight.w200,
          titleColor: appWhite,
        ),
        width10,
        InkWell(
          onTap: onPressed,
          child: TitleOfScreen(
            title: titleButtom,
            titleFontSize: 20,
            titleletterSpacing: 0,
            titlefontWeight: FontWeight.w200,
            titleColor: app2DarkGreen,
          ),
        )
      ],
    );
  }
}
