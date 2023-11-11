import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/about_model.dart';
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
  AboutModel? name;
  bool isWaiting = true;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    data = getAboutApi();
    name = await data;
    isWaiting = false;
    setState(() {});
    return name!.data!.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        hasAction: true,
        title: "Profile ${name?.data?.name?.toUpperCase() ?? "..."}",
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.getHeight() * .02),
                    ProfileUserInformation(userData: snapshot.data),
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
      floatingActionButton:
          Text("${name?.data?.email ?? "..."}\n${name?.data?.phone ?? "..."}"),
    );
  }
}
