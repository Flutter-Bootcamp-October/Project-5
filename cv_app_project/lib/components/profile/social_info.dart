import 'package:cv_app_project/components/profile/profile_divsion.dart';
import 'package:cv_app_project/components/profile/social_media_account.dart';
import 'package:flutter/material.dart';

class SocialMedialInfo extends StatelessWidget {
  const SocialMedialInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileDivsion(
          title: 'Social Media',
          lineSize: 0.55,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Card(
                color: Color(0xffFFC436),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(width: double.infinity),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SocialAccount(
                          username: 'Snapchat: AbdullahM',
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff0174BE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SocialAccount(
                          username: 'Instagram: Abdullah',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
