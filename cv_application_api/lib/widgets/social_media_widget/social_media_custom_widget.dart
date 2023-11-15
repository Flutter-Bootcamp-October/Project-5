import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/social_media_model.dart';
import 'package:cv_application_api/pages/skills_and_soical_media_screen/add_social_media_screen.dart';
import 'package:cv_application_api/services/api/social_media_api.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class SocialMediaCustomWidget extends StatefulWidget {
  const SocialMediaCustomWidget({super.key});

  @override
  State<SocialMediaCustomWidget> createState() =>
      _SocialMediaCustomWidgetState();
}

class _SocialMediaCustomWidgetState extends State<SocialMediaCustomWidget> {
  bool _isLoading = true;
  SocialMedia? socialMedia;
  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
    setState(() {});
  }

  Future<SocialMedia?> getUserInfoMethode() async {
    final SocialMedia? response = await getUserSocialMedia(context: context);
    socialMedia = response;
    return socialMedia;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddSoicalMediaScreen();
            }));
            setState(() {});
          },
          child: const TitleOfScreen(
            title: "Add Soical Media",
            titleFontSize: 30,
            titleletterSpacing: 3,
            titleColor: appWhite,
            titlefontWeight: FontWeight.bold,
          ),
        ),
        if (_isLoading == true)
          const Center(
            child: CircularProgressIndicator(
              color: app2DarkGreen,
            ),
          ),
        if (_isLoading == false)
          for (int i = 0; i < socialMedia!.socialMediaData!.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: app2DarkGreenTrans),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleOfScreen(
                              title: 'Social Media :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height10,
                            NormalText(
                              title: socialMedia?.socialMediaData![i].social! ??
                                  '',
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Username :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height10,
                            NormalText(
                              title:
                                  socialMedia?.socialMediaData![i].username! ??
                                      '',
                              titleFontSize: 15,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 230,
                    child: IconButton(
                        onPressed: () async {
                          await deleteUserSocialMedia(context: context, {
                            "id_social": socialMedia!.socialMediaData![i].id,
                          });
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.remove_rounded,
                          size: 40,
                        )),
                  ),
                ],
              ),
            ),
      ],
    );
  }
}
