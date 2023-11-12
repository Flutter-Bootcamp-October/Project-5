import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:flutter/material.dart';

class singleSocial extends StatelessWidget {
  const singleSocial(
      {super.key, required this.SocailName, required this.userName});
  final String SocailName;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            SocailName,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(userName),
          ),
        ],
      ),
    );
  }
}
