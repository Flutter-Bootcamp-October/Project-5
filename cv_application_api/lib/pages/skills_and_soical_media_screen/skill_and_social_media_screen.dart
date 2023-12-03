import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/widgets/skill_widget/skill_custom_widget.dart';
import 'package:cv_application_api/widgets/social_media_widget/social_media_custom_widget.dart';
import 'package:flutter/material.dart';

class SkillAndSocialMediaScreen extends StatefulWidget {
  const SkillAndSocialMediaScreen({super.key});

  @override
  State<SkillAndSocialMediaScreen> createState() => _SkillAndSocialMediaScreenState();
}

class _SkillAndSocialMediaScreenState extends State<SkillAndSocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SkillCustomWidget(),
                  height30,
                  SocialMediaCustomWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
