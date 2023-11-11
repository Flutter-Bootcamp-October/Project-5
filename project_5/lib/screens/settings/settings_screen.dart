import 'package:flutter/material.dart';
import 'package:project_5/main.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/settings/components/theme_settings.dart';

import 'components/account_settings.dart';
import 'components/profile_settings.dart';
import 'components/settings_options.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map> settingsOptionsList = [
      {
        "title": "Profile",
        "subTitle": "Edit Your Profile",
        "iconData": Icons.person,
        "onTapFunc": () {
          navigationPush(
              context: context, screen: const ProfileSettingsScreen());
        },
      },
      {
        "title": "Theme",
        "subTitle": "Set Your Theme",
        "iconData": Icons.color_lens,
        "onTapFunc": () {
          navigationPush(context: context, screen: const ThemeSettingsScreen());
        },
      },
      {
        "title": "Account",
        "subTitle": "Login & Account Information",
        "iconData": Icons.account_circle_rounded,
        "onTapFunc": () {
          navigationPush(
              context: context, screen: const AccountInformationScreen());
        },
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(hasAction: false, title: "Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingsOptionsList.length,
              itemBuilder: (context, index) => SettingsOption(
                onTapFunc: settingsOptionsList[index]["onTapFunc"],
                title: settingsOptionsList[index]["title"],
                subTitle: settingsOptionsList[index]["subTitle"],
                iconData: settingsOptionsList[index]["iconData"],
                isSettings: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AuthButton(
          content: "Log Out",
          color: Colors.grey[400]!,
          onPressedFunc: () {
            pref.cleanToken();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (route) => false);
          },
          isDisabled: false),
    );
  }
}
