// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/skill_model.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:cv_application_api/services/api/skill_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:cv_application_api/widgets/profile_widget/update_info_custom_text_field.dart';
import 'package:flutter/material.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({super.key});

  @override
  State<AddSkillScreen> createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {
  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
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
                        title: 'My Skill',
                        titleFontSize: 30,
                        titleletterSpacing: 3,
                        titlefontWeight: FontWeight.w300,
                        titleColor: appWhite,
                      ),
                      height20,
                      Container(
                        height: 270,
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
                              height14,
                              const TitleOfScreen(
                                title: 'Skill :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: skillController,
                                hintText: 'skill ',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 78),
                                child: CustomButtom(
                                  textButtom: 'Save',
                                  onPressed: () async {
                                    try {
                                      if (skillController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Please fill all field"),
                                          ),
                                        );
                                      }

                                      final Skill? response =
                                          await postUserSkill(
                                              context: context,
                                              {
                                            "skill": skillController.text,
                                          });

                                      if (response?.codeState == 200) {
                                        print(response?.msg);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const NavBarScreen();
                                        }));
                                      } else {
                                        showDialog(
                                          context: context,
                                          barrierColor: appcoldGreenTrans,
                                          builder: (context) => const Center(
                                            child: CircularProgressIndicator(
                                              color: app2DarkGreen,
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (error) {
                                      print(error);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
