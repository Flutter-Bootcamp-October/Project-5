import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/modules/about_module.dart';
import 'package:cv/modules/skill_module.dart';
import 'package:cv/modules/social.dart';
import 'package:cv/services/about_api.dart';
import 'package:cv/services/skill_api.dart';
import 'package:cv/services/social.dart';
import 'package:cv/widgets/about_info_card.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/skill_card.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/social_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AboutMe extends StatefulWidget {
  AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  TextEditingController socialNameController = TextEditingController(),
      usersnameController = TextEditingController(),
      skillNameController = TextEditingController();
  AboutModel? user;
  Social? social;
  Skill? skill;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAbout();
    loadSocial();
    loadSkill();
  }

  loadAbout() async {
    user = await getAllAboutData();
    print(user?.data.id);
    setState(() {});
  }

  loadSocial() async {
    social = await getAllSocialData();
    print(social?.data![0].social);
    setState(() {});
  }

  loadSkill() async {
    skill = await getAllSkillData();
    print(skill?.data![0].skill);
    setState(() {});
  }

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
        title: Text(
          user?.data.about ?? "About me",
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
                AboutInfoCard(
                  nameUser: user?.data.name ?? "Lujain Bawazir",
                  aboutme: user?.data.about ?? "about me",
                  brithday: user?.data.birthday ?? "1998/09/12",
                  nameCity: user?.data.location ?? "Riyadh",
                  userPhone: user?.data.phone ?? "0553218334",
                ),
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
                                                onpressed: () async {
                                                  Response result =
                                                      await sendSkillData(
                                                          skillNameController
                                                              .text);
                                                  if (result.statusCode ==
                                                      200) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                ("new skill has been added successfully"))));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          ("error"),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
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
                                                    onpressed: () async {
                                                      Response result =
                                                          await sendSocialData(
                                                              socialNameController
                                                                  .text,
                                                              usersnameController
                                                                  .text);
                                                      if (result!.statusCode ==
                                                          200) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    ("new social has been added successfully"))));
                                                      }
                                                    },
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
                      SocailCard(),
                    ],
                  ),
                ),
                height48,
                Appbutton(
                    onpressed: () {},
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
