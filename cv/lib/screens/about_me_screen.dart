import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/about_info_card.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/project_card.dart';
import 'package:cv/widgets/skill_card.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:cv/widgets/social_card.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  AboutMe({super.key});

  TextEditingController socialNameController = TextEditingController(),
      usersnameController = TextEditingController(),
      skillNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: const Text(
          "About me",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // image file type
                //read as bytes for image
                const AboutInfoCard(),
                Container(),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Text(
                              "Skills",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            AddNewButton(
                              color: AppColors.primaryColor,
                              iconColor: AppColors.primaryColor,
                              title: "Add new",
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8))),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16, top: 64),
                                        child: Column(
                                          children: [
                                            const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "Add new skill",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            BottomSheetFiled(
                                              controller: skillNameController,
                                              lable: "Skill Name",
                                            ),
                                            Appbutton(
                                                onpressed: () {},
                                                btnColor:
                                                    AppColors.primaryColor,
                                                title: "Add",
                                                titleColor: Colors.white),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      height16,
                      const SkillCard(),
                      height22,
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Text(
                              "Social Media",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            AddNewButton(
                                color: AppColors.primaryColor,
                                iconColor: AppColors.primaryColor,
                                title: "Add new",
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(8))),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16, top: 64),
                                            child: Column(
                                              children: [
                                                const Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "Add new social media",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                BottomSheetFiled(
                                                  controller:
                                                      socialNameController,
                                                  lable: "Social Media Name",
                                                ),
                                                BottomSheetFiled(
                                                  controller:
                                                      usersnameController,
                                                  lable: "UserName",
                                                ),
                                                Appbutton(
                                                    onpressed: () {},
                                                    btnColor:
                                                        AppColors.primaryColor,
                                                    title: "Add",
                                                    titleColor: Colors.white),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                }),
                          ],
                        ),
                      ),
                      height16,
                      const SocailCard(),
                    ],
                  ),
                ),
                height48,
                Appbutton(
                    onpressed: () {
                      //(delete)
                    },
                    title: "Delete Account",
                    titleColor: Colors.white,
                    btnColor: AppColors.redColor)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
