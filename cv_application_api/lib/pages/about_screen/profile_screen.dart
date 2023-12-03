import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_info_model.dart';
import 'package:cv_application_api/pages/about_screen/update_profile_screen.dart';
import 'package:cv_application_api/services/api/user_about_api.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo? user;
  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
  }

  Future<UserInfo> getUserInfoMethode() async {
    final UserInfo? response = await getUserInfo(context: context);
    print(response!.userInfodData!.name);
    user = response;
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleOfScreen(
                      title: 'My Account',
                      titleFontSize: 30,
                      titleletterSpacing: 3,
                      titlefontWeight: FontWeight.w300,
                      titleColor: appWhite,
                    ),
                    height20,
                    if (user == null)
                      const Center(
                        child: CircularProgressIndicator(
                          color: app2DarkGreen,
                        ),
                      ),
                    if (user != null)
                      Container(
                        height: 530,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: app2DarkGreenTrans),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Stack(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                height14,
                                const TitleOfScreen(
                                  title: 'Name :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user!.userInfodData!.name!,
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'Email :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user!.userInfodData!.email!,
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'Position :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title:
                                      user?.userInfodData!.titlePosition ?? '',
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'Phone Number :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user!.userInfodData!.phone!,
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'Location :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user?.userInfodData!.location ?? '',
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'Birthday :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user!.userInfodData!.birthday ?? '',
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height14,
                                const TitleOfScreen(
                                  title: 'About :',
                                  titleFontSize: 18,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                                height4,
                                NormalText(
                                  title: user?.userInfodData!.about ?? '',
                                  titleFontSize: 15,
                                  titleletterSpacing: 0,
                                  titlefontWeight: FontWeight.w300,
                                  titleColor: appWhite,
                                ),
                              ],
                            ),
                            Positioned(
                              left: 230,
                              top: 5,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const UpdateProfileScreen();
                                    }));
                                  },
                                  icon: const Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: appWhiteTrans,
                                  )),
                            ),
                          ]),
                        ),
                      )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
