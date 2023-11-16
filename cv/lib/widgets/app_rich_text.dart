import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText(
      {super.key,
      required this.text,
      required this.linkText,
      required this.onTap});
  final String text;
  final String linkText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            linkText,
            style: TextStyle(
                fontWeight: FontWeight.w600, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
