import 'package:cv/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.title, required this.onTap});
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor.withOpacity(0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, color: AppColors.primaryColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.primaryColor,
            )
          ]),
        ),
      ),
    );
  }
}
