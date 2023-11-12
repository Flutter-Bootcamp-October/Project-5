import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/main.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/profile/components/experience.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/services/about_api.dart';

import 'components/education.dart';
import 'components/profile_user_information.dart';
import 'components/section_title.dart';
import 'components/skills.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Future? data;
  AboutModel? aboutModel;

  bool isWaiting = true;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    final check = checkTokenValidity(check: await getAboutApi());
    if (check) {
      data = getAboutApi();
      aboutModel = await data;
      isWaiting = false;
      setState(() {});
      return aboutModel!.data!.name;
    }
  }

  bool checkTokenValidity({required check}) {
    if (check == "Token is expired or invalid") {
      pref.cleanToken();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Token Has Expired")));
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
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        hasAction: true,
        title: "Profile ${aboutModel?.data?.name?.toUpperCase() ?? "..."}",
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final AboutModel x = snapshot.data!;
                print(x.data!.name);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.getHeight() * .02),
                    ProfileUserInformation(userData: aboutModel),
                    //--Education--
                    SectionTitle(
                        title: "Education 🎓",
                        iconData: Icons.mode_edit_outline_outlined,
                        onPressedFunc: () {}),
                    const Education(),
                    //--Skills--
                    SectionTitle(
                      title: "Skills 🚀",
                      iconData: Icons.add,
                      onPressedFunc: () {},
                    ),
                    const Skills(),
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
                );
              } else {
                return Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: const Text("waiting"),
                  ),
                );
              }
            }),
      ),
      floatingActionButton: SelectableText(
          "${aboutModel?.data?.email ?? "..."}\n${aboutModel?.data?.phone ?? "..."}"),
    );
  }
}
