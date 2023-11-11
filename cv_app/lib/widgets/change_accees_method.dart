import 'package:cv_app/globals/colors.dart';
import 'package:flutter/material.dart';

class ChangeAccessMethod extends StatelessWidget {
  const ChangeAccessMethod({
    super.key,
    required this.quistion,
    required this.accessMethos,
    required this.onTap,
  });
  final String quistion;
  final String accessMethos;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(quistion),
        InkWell(
          onTap: onTap,
          child: Text(
            accessMethos,
            style:
                const TextStyle(color: mainColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}