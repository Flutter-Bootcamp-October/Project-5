import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/profile/components/experience.dart';
import 'package:project_5/screens/settings/settings_screen.dart';

import 'components/education.dart';
import 'components/profile_user_information.dart';
import 'components/section_title.dart';
import 'components/skills.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xffe1dfef),
        elevation: 1.5,
        scrolledUnderElevation: 2.5,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              iconSize: 26,
              onPressed: () {
                navigationPush(context, const SettingsScreen());
              },
              icon: const Icon(Icons.settings_outlined))
        ],
        title: const Text("Profile {UserName}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.getHeight() * .02),
            const ProfileUserInformation(),
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
        ),
      ),
      floatingActionButton: const Text("Email@gmail.com\n055450958"),
    );
  }
}
