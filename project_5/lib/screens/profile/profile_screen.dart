import 'package:project_5/navigations/navigation_methods.dart';

import 'exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future? aboutModelData;
  Future? skillsModelData;
  Future? educationModelData;
  Future? socialModelData;
  Future? projectsModelData;

  AboutModel? aboutModel;

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
    // print(pref.getToken());
    if (check == "Token is expired or invalid") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Token Has Expired")));
      pref.cleanToken();

      navigation(
          context: context, screen:  SignInScreen(), type: "pushRemove");
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
          currentUser: aboutModel,
          title: "Profile ${aboutModel?.data?.name?.toUpperCase() ?? "..."}"),
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
                        imageUrl: snapshot.data.data?.image ?? placeHolderImage,
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
                title: "Projects 📝",
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
                  updateProjects: updateProjectsModel),
            ],
          ),
        ),
      ),
      floatingActionButton: SelectableText(
          "${aboutModel?.data?.email ?? "..."}\n${aboutModel?.data?.phone ?? "..."}"),
    );
  }
}
