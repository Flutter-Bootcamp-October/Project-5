import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/social_media/social_media_data_model.dart';
import 'package:cv_app/models/social_media/social_media_model.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
   SocialMediaWidget({
    super.key,
  });
  late SocialMediaData socialmedia;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: eggShell),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'lib/assets/icon_social_media/instagram.png',
            width: 50,
            height: 50,
          ),
          Column(
            children: [
              height12,
              Text(
                socialmedia.social,
                style: TextStyle(
                    fontSize: 20,
                    color: payneGrey,
                    fontWeight: FontWeight.w700),
              ),
              Text(socialmedia.username,
                  style: TextStyle(
                      fontSize: 24,
                      color: payneGrey,
                      fontWeight: FontWeight.w700)),
              height10,
            ],
          )
        ],
      ),
    );
  }
}
