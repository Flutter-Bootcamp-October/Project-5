import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/profile/components/projects.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/reusable_widgets/education_model_sheet.dart';
import 'package:project_5/screens/reusable_widgets/projectsModalBottomSheet.dart';
import 'package:project_5/screens/settings/components/custom_bottom_modal_sheet.dart';
import 'package:project_5/services/about_api.dart';
import 'package:project_5/services/education_api.dart';
import 'package:project_5/services/projects_api.dart';
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
  Future? projectsModelData;

  TextEditingController skillsController = TextEditingController();

  TextEditingController gradDateController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController specializationController = TextEditingController();

  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

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
      projectsModelData = getProjectsData();
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
    aboutModelData = getAboutApi();
    Future.delayed(const Duration(seconds: 2), () => setState(() {}));
  }

  updateSkillsModel() async {
    skillsModelData = getSkillsData();
    setState(() {});
  }

  updateEducationModel() async {
    educationModelData = getEducationData();
    Future.delayed(const Duration(seconds: 2), () => setState(() {}));
  }

  updateSocialModel() async {
    socialModelData = getSocialData();
    Future.delayed(const Duration(seconds: 2), () => setState(() {}));
  }

  updateProjectsModel() async {
    projectsModelData = getProjectsData();
    Future.delayed(const Duration(seconds: 2), () => setState(() {}));
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
                        updateAboutData: updateAboutData,
                        aboutModelData: aboutModelData,
                        imageUrl: snapshot.data.data?.image ??
                            "https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png",
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
                onPressedFunc: () {
                  educationModalBottomSheet(
                    context,
                    content: "Education",
                    isSkills: true,
                    gradDateController: gradDateController,
                    collegeController: collegeController,
                    universityController: universityController,
                    specializationController: specializationController,
                    updateMethod: updateEducationModel,
                  );
                },
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
                title: "Projects 💼",
                iconData: Icons.add,
                onPressedFunc: () {
                  projectsModalBottomSheet(context,
                      projectNameController: projectNameController,
                      projectDescriptionController:
                          projectDescriptionController,
                      content: "Project",
                      updateMethod: updateProjectsModel);
                },
              ),
              Projects(
                projectsData: projectsModelData,
                updateProjects: updateProjectsModel,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SelectableText(
          "${aboutModel?.data?.email ?? "..."}\n${aboutModel?.data?.phone ?? "..."}"),
    );
  }
}
