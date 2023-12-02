import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/education%20bloc/education_cubit.dart';
import 'package:project_5/bloc/projects_bloc/projects_cubit.dart';
import 'package:project_5/bloc/skills_bloc/skills_cubit.dart';
import 'package:project_5/bloc/social_bloc/social_cubit.dart';
import 'package:project_5/navigations/navigation_methods.dart';

import 'exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future? aboutModelData;
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

      setState(() {});
    }
  }

  bool checkTokenValidity({required check}) {
    // print(pref.getToken());
    if (check == "Token is expired or invalid") {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Token Has Expired")));
      pref.cleanToken();

      navigation(context: context, screen: SignInScreen(), type: "pushRemove");
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

              //--Social--
              BlocBuilder<SocialCubit, SocialState>(
                builder: (context, state) {
                  return Social(state: state);
                },
              ),

              const Divider(thickness: .8, indent: 16, endIndent: 16, color: Color(0xffded3fc)),

              //--Education--
              BlocConsumer<EducationCubit, EducationState>(
                builder: (context, state) {
                  return Wrap(
                    children: [
                      SectionTitle(
                        title: "Education 🎓",
                        iconData: Icons.add,
                        onPressedFunc: () {
                          educationModalBottomSheet(
                            state: state,
                            context,
                            content: "Education",
                            isSkills: true,
                            gradDateController: gradDateController,
                            collegeController: collegeController,
                            universityController: universityController,
                            specializationController: specializationController,
                          );
                        },
                      ),
                      Education(state: state),
                    ],
                  );
                },
                listener: (BuildContext context, EducationState state) {
                  if (state is EducationAddState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Education has been added")));
                  }
                  if (state is EducationErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(bottom: (context.getHeight() * .5)),
                        content: Text(state.errMsg)));
                  }
                },
              ),

              //--Skills--
              BlocConsumer<SkillsCubit, SkillsState>(
                listener: (context, state) {
                  if (state is SkillsAddState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Skill has been added")));
                  }
                  if (state is SkillsErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(bottom: (context.getHeight() * .5)),
                        content: Text(state.errMsg)));
                  }
                },
                builder: (context, state) {
                  return Wrap(
                    children: [
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
                              context
                                  .read<SkillsCubit>()
                                  .addSkillsCubit(skillsController: skillsController);
                            },
                          );
                        },
                      ),
                      Skills(state: state),
                    ],
                  );
                },
              ),

              //--Projects--
              BlocConsumer<ProjectsCubit, ProjectsState>(
                listener: (context, state) {
                  if (state is ProjectsAddState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Project has been added")));
                  }
                  if (state is ProjectsErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.only(bottom: (context.getHeight() * .5)),
                        content: Text(state.errMsg)));
                  }
                },
                builder: (context, state) {
                  return Wrap(
                    children: [
                      SectionTitle(
                        title: "Projects 📝",
                        iconData: Icons.add,
                        onPressedFunc: () {
                          projectsModalBottomSheet(context,
                              projectNameController: projectNameController,
                              projectDescriptionController: projectDescriptionController,
                              content: "Project",
                              state: state);
                        },
                      ),
                      Projects(state: state),
                    ],
                  );
                },
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
