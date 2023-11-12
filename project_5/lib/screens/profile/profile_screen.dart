import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/profile/components/experience.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/settings/components/custom_bottom_modal_sheet.dart';
import 'package:project_5/services/about_api.dart';
import 'package:project_5/services/skills_api.dart';
import 'package:project_5/theme/shimmer/shimmer_profile_header_skeleton.dart';

import 'components/education.dart';
import 'components/profile_user_information.dart';
import 'components/section_title.dart';
import 'components/skills.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future? aboutModelData;
  AboutModel? aboutModel;
  Future? skillsModelData;
  TextEditingController skillsController = TextEditingController();
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

      setState(() {});
    }
  }

  updateAboutModel() async {
    aboutModel = await aboutModelData;
    setState(() {});
  }

  updateSkillsModel() async {
    skillsModelData = getSkillsData();
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasAction: true,
        title: "Profile ${aboutModel?.data?.name?.toUpperCase() ?? "..."}",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeight() * .02),
            FutureBuilder(
                future: aboutModelData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final AboutModel x = snapshot.data;
                    return ProfileUserInformation(
                      aboutModelData: aboutModelData,
                      imageUrl: x.data?.image,
                    );
                  } else {
                    loadData();
                    return const ShimmerProfileHeaderSkeleton();
                  }
                }),
            //--Education--
            SectionTitle(
              title: "Education 🎓",
              iconData: Icons.mode_edit_outline_outlined,
              onPressedFunc: () {},
            ),
            const Education(),
            //--Skills--
            SectionTitle(
              title: "Skills 🚀",
              iconData: Icons.add,
              onPressedFunc: () {
                customModalBottomSheet(
                  context,
                  controller: skillsController,
                  content: "Skills",
                  onPressedFunc: () {
                    if (skillsController.text.isNotEmpty) {
                      addSkills(skill: skillsController.text);
                      setState(() {
                        loadData();
                        skillsController.clear();
                        Navigator.pop(context);
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please Enter a Name for the Skill")));
                    }
                  },
                  isSkills: true,
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
      floatingActionButton: SelectableText(
          "${aboutModel?.data?.email ?? "..."}\n${aboutModel?.data?.phone ?? "..."}"),
    );
  }
}
