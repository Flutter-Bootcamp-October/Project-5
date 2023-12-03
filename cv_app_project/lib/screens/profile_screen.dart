import 'package:cv_app_project/components/profile/about_info.dart';
import 'package:cv_app_project/components/profile/education_info.dart';
import 'package:cv_app_project/components/profile/profile_info.dart';
import 'package:cv_app_project/components/profile/project_info.dart';
import 'package:cv_app_project/components/profile/skill_info.dart';
import 'package:cv_app_project/components/profile/social_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileInfoCard(),
            SizedBox(height: 24),
            AboutInfo(),
            EducationInfo(),
            projectInfo(),
            SKillInfo(),
            SocialMedialInfo(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
