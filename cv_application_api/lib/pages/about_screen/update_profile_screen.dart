// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_info_model.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:cv_application_api/services/api/user_about_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:cv_application_api/widgets/profile_widget/update_info_custom_text_field.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreen();
}

class _UpdateProfileScreen extends State<UpdateProfileScreen> {
  UserInfo? user;
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
  }

  Future<UserInfo> getUserInfoMethode() async {
    final UserInfo? response = await getUserInfo(context: context);
    print(response!.userInfodData!.name);
    user = response;

    nameController =
        TextEditingController(text: user?.userInfodData!.name! ?? '');
    positionController =
        TextEditingController(text: user?.userInfodData!.titlePosition ?? '');
    locationController =
        TextEditingController(text: user?.userInfodData!.location ?? '');
    phoneController =
        TextEditingController(text: user?.userInfodData!.phone ?? '');
    birthdayController =
        TextEditingController(text: user?.userInfodData!.birthday ?? '');
    aboutController =
        TextEditingController(text: user?.userInfodData!.about ?? '');
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          const BackgroundImage(),
          const BackgroundWhiteContainer(),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: app3DarkGreen,
                  size: 30,
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleOfScreen(
                      title: 'Update My Account',
                      titleFontSize: 30,
                      titleletterSpacing: 3,
                      titlefontWeight: FontWeight.w300,
                      titleColor: appWhite,
                    ),
                    height14,
                    Container(
                      height: 650,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: app2DarkGreenTrans),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TitleOfScreen(
                              title: 'Name :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            UpdateInfoCustomTextField(
                              textController: nameController,
                              hintText: 'Name',
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                            UpdateInfoCustomTextField(
                              textController: positionController,
                              hintText: 'Your title position',
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                            UpdateInfoCustomTextField(
                              textController: phoneController,
                              hintText: 'Phone number',
                              obscureText: false,
                              keyboardType: TextInputType.phone,
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
                            UpdateInfoCustomTextField(
                              textController: locationController,
                              hintText: 'Your location',
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                            UpdateInfoCustomTextField(
                              textController: birthdayController,
                              hintText: 'MM/DD/YYYY',
                              obscureText: false,
                              keyboardType: TextInputType.datetime,
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
                            UpdateInfoCustomTextField(
                              textController: aboutController,
                              hintText: 'About your self',
                              obscureText: false,
                              keyboardType: TextInputType.name,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 78),
                                child: CustomButtom(
                                  textButtom: 'Save',
                                  onPressed: () async {
                                    try {
                                      showDialog(
                                        context: context,
                                        barrierColor: appcoldGreenTrans,
                                        builder: (context) => const Center(
                                          child: CircularProgressIndicator(
                                            color: app2DarkGreen,
                                          ),
                                        ),
                                      );

                                      final UserInfo? response =
                                          await updateUserInfo(
                                              context: context,
                                              {
                                            "name": nameController.text,
                                            "title_position":
                                                positionController.text,
                                            "phone": phoneController.text,
                                            "location": locationController.text,
                                            "birthday": birthdayController.text,
                                            "about": aboutController.text
                                          });

                                      if (response?.codeState == 200) {
                                        // print(response?.msg);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const NavBarScreen();
                                        }));
                                      }
                                    } catch (error) {
                                      // print(error);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    }
                                  },
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
