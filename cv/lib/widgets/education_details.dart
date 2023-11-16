import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:flutter/material.dart';

class EducationDetail extends StatelessWidget {
  const EducationDetail({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
