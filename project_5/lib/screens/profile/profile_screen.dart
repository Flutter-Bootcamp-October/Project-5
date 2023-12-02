import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/about_bloc/about_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.getWidth(), context.getHeight() * 0.07),
        child: BlocBuilder<AboutCubit, AboutState>(
          buildWhen: (previous, current) => current is AboutGetDataState,
          builder: (context, state) {
            return state is AboutGetDataState
                ? CustomAppBar(
                    hasAction: true,
                    currentUser: state.aboutModel,
                    title:
                        "Profile ${state.aboutModel.data?.name?.toUpperCase() ?? "..."}")
                : const CustomAppBar(hasAction: true, title: "Profile ...");
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeight() * .02),

            BlocConsumer<AboutCubit, AboutState>(
              // buildWhen: (previous, current) => ,
              builder: (context, state) {
                return ProfileUserInformation(state: state);
              },
              listener: (BuildContext context, AboutState state) {
                if (state is AboutChangeBioState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Bio has been changed successfully")));
                }
                if (state is AboutErrorState) {
                  customSnackBar(
                      context: context, message: "No Image was selected");
                }
              },
            ),

            //--Social--
            BlocBuilder<SocialCubit, SocialState>(
              builder: (context, state) {
                return Social(state: state);
              },
            ),

            const Divider(
                thickness: .8,
                indent: 16,
                endIndent: 16,
                color: Color(0xffded3fc)),

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
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Education has been added")));
                }
                if (state is EducationErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin:
                          EdgeInsets.only(bottom: (context.getHeight() * .5)),
                      content: Text(state.errMsg)));
                }
              },
            ),

            //--Skills--
            BlocConsumer<SkillsCubit, SkillsState>(
              listener: (context, state) {
                if (state is SkillsAddState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Skill has been added")));
                }
                if (state is SkillsErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin:
                          EdgeInsets.only(bottom: (context.getHeight() * .5)),
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
                            context.read<SkillsCubit>().addSkillsCubit(
                                skillsController: skillsController);
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
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Project has been added")));
                }
                if (state is ProjectsErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      margin:
                          EdgeInsets.only(bottom: (context.getHeight() * .5)),
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
                            projectDescriptionController:
                                projectDescriptionController,
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
      floatingActionButton: BlocBuilder<AboutCubit, AboutState>(
        builder: (context, state) {
          return state is AboutGetDataState
              ? SelectableText(
                  "${state.aboutModel.data?.email ?? "..."}\n${state.aboutModel.data?.phone ?? "..."}")
              : const Text("...");
        },
      ),
    );
  }
}
