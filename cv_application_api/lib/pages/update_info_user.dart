import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/user_info.dart';
import 'package:cv_application_api/services/api/user_info.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title.dart';
import 'package:cv_application_api/widgets/profile_widget/update_info_custom_text_field.dart';
import 'package:flutter/material.dart';

class UpdateInfoUser extends StatefulWidget {
  const UpdateInfoUser({super.key});

  @override
  State<UpdateInfoUser> createState() => _UpdateInfoUserState();
}

class _UpdateInfoUserState extends State<UpdateInfoUser> {
  UserInfo? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfoMethode();
  }

  Future<UserInfo> getUserInfoMethode() async {
    final UserInfo? response = await getUserInfo(context: context);
    print(response!.data!.name);
    user = response;
    setState(() {});
    return response;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          const BackgroundImage(),
          const BackgroundWhiteContainer(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 800,
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
                              title: 'Update My Account',
                              titleFontSize: 30,
                              titleletterSpacing: 3,
                              titlefontWeight: FontWeight.w300,
                              titleColor: app3DarkGreen,
                            ),
                            height14,
                            const TitleOfScreen(
                              title: 'Name :',
                              titleFontSize: 18,
                              titleletterSpacing: 0,
                              titlefontWeight: FontWeight.w300,
                              titleColor: appWhite,
                            ),
                            height4,
                            UpdateInfoCustomTextField(
                              controller: nameController,
                              hintText: user!.data!.name!,
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                            UpdateInfoCustomTextField(
                              controller: emailController,
                              hintText: user!.data!.email!,
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
                              controller: positionController,
                              hintText:
                                  user!.data!.titlePosition != null ? '' : '',
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
                              controller: phoneController,
                              hintText: user!.data!.phone!,
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                            // NormalText(
                            UpdateInfoCustomTextField(
                              controller: locationController,
                              hintText: user!.data!.location != null ? '' : '',
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
                              controller: birthdayController,
                              hintText: user!.data!.birthday != null ? '' : '',
                              obscureText: false,
                              keyboardType: TextInputType.name,
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
                              controller: aboutController,
                              hintText: user!.data!.birthday != null ? '' : '',
                              obscureText: false,
                              keyboardType: TextInputType.name,
                            ),

                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 20),
                                child: TextButton(
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
                                          await updateUserInfo({
                                        "name": nameController.text,
                                        "phone": phoneController.text,
                                        "email": emailController.text,
                                        "titlePosition":
                                            positionController.text,
                                        "location": locationController.text,
                                        "birthday": birthdayController.text,
                                        "about": aboutController.text
                                      });

                                      if (user!.codeState == 200) {
                                        print(user!.msg);
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return OTPScreen(
                                        //     typeOTP: "registration",
                                        //     user: response,
                                        //   );
                                        // }));
                                      }
                                    } catch (error) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    }
                                  },
                                  child: const NormalText(
                                    title: 'Save',
                                    titleFontSize: 15,
                                    titleletterSpacing: 0,
                                    titlefontWeight: FontWeight.w300,
                                    titleColor: appWhite,
                                  ),
                                ))
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
