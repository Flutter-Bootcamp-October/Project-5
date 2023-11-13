import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/profile/components/experience.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/settings/components/custom_bottom_modal_sheet.dart';
import 'package:project_5/services/about_api.dart';
import 'package:project_5/services/education_api.dart';
import 'package:project_5/services/skills_api.dart';
import 'package:project_5/services/social_api.dart';
import 'package:project_5/theme/shimmer/shimmer_profile_header_skeleton.dart';

import 'components/education.dart';
import 'components/profile_user_information.dart';
import 'components/section_title.dart';
import 'components/skills.dart';
import 'components/social.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future? aboutModelData;
  AboutModel? aboutModel;
  Future? skillsModelData;
  Future? educationModelData;
  Future? socialModelData;

  TextEditingController skillsController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    final check = checkTokenValidity(check: await getAboutApi());
    if (check) {
      aboutModel = await aboutModelData;
      aboutModelData = getAboutApi();
      skillsModelData = getSkillsData();
      educationModelData = getEducationData();
      socialModelData = getSocialData();
      setState(() {});
    }
  }

  bool checkTokenValidity({required check}) {
    print(pref.getToken());
    if (check == "Token is expired or invalid") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Token Has Expired")));
      pref.cleanToken();

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SignInScreen(),
          ),
          (route) => false);
      //Token expired
      return false;
    } else {
      //Token not expired
      return true;
    }
  }

  updateAboutData() async {
    aboutModel = await aboutModelData;
    setState(() {});
  }

  updateSkillsModel() async {
    skillsModelData = getSkillsData();
    setState(() {});
  }

  updateEducationModel() async {
    educationModelData = getEducationData();
    setState(() {});
  }

  updateSocialModel() async {
    socialModelData = getSocialData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasAction: true,
        title: "Profile ${aboutModel?.data?.name?.toUpperCase() ?? "..."}",
      ),
      body: RefreshIndicator(
        strokeWidth: 3,
        onRefresh: () async {
          await loadData();
          setState(() {});
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.getHeight() * .02),
              FutureBuilder(
                  future: aboutModelData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ProfileUserInformation(
                        aboutModelData: aboutModelData,
                        imageUrl: snapshot.data.data?.image,
                      );
                    } else {
                      updateAboutData();
                      return const ShimmerProfileHeaderSkeleton();
                    }
                  }),
              //Social
              Social(
                  updateMethod: updateSocialModel, socialData: socialModelData),
              const Divider(
                  thickness: .8,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xffded3fc)),
              //--Education--
              SectionTitle(
                title: "Education 🎓",
                iconData: Icons.add,
                onPressedFunc: () {},
              ),
              Education(
                  updateMethod: updateEducationModel,
                  educationData: educationModelData),
              //--Skills--
              SectionTitle(
                title: "Skills 🚀",
                iconData: Icons.add,
                onPressedFunc: () {
                  customModalBottomSheet(
                    context,
                    controller: skillsController,
                    content: "Skills",
                    isSkills: true,
                    onPressedFunc: () {
                      if (skillsController.text.isNotEmpty) {
                        addSkills(skill: skillsController.text);
                        setState(() {
                          loadData();
                          skillsController.clear();
                          Navigator.pop(context);
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Please Enter a Name for the Skill")));
                      }
                    },
                  );
                },
              ),
              Skills(
                  skillsData: skillsModelData, updateMethod: updateSkillsModel),
              //--Experiences--
              SectionTitle(
                title: "Experiences 💼",
                iconData: Icons.add,
                onPressedFunc: () {},
              ),
              const Experience(),
              //--PlaceHolder--
              SectionTitle(
                title: "PlaceHolder 💭󠀠󠀠",
                iconData: Icons.add,
                onPressedFunc: () {},
              ),
            ],
          ),

          // else {
          //   return Center(
          //     child: Shimmer.fromColors(
          //       baseColor: Colors.white,
          //       highlightColor: Colors.grey,
          //       child: const Text("waiting"),
          //     ),
          //   );
          // }
        ),
      ),
      floatingActionButton: SelectableText(
          "${aboutModel?.data?.email ?? "..."}\n${aboutModel?.data?.phone ?? "..."}"),
    );
  }
}
