
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightEggShell),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height4,
          Image.asset(
            'lib/assets/icon_social_media/instagram.png',
            width: 50,
            height: 50,
          ),
          height10,
          Text('Instagram')
        ],
      ),
    );
  }
}
