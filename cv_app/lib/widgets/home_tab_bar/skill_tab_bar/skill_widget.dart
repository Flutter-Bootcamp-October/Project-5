
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  const SkillWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        height4,
        Image.asset(
          'lib/assets/icon_skills/html-5.png',
          width: 50,
          height: 50,
        ),
        height10,
        Text('Html')
      ],
    );
  }
}
