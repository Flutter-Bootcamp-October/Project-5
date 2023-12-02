import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/theme_bloc/theme_cubit.dart';
import 'package:project_5/main.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/screens/settings/components/theme_settings.dart';
import 'components/account_settings.dart';
import 'components/settings_options.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, required this.currentUserInfo}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
  final currentUserInfo;
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map> settingsOptionsList = [
      // {
      //   "title": "Profile",
      //   "subTitle": "Edit Your Profile",
      //   "iconData": Icons.person,
      //   "onTapFunc": () {
      //     navigationPush(
      //         context: context, screen: const ProfileSettingsScreen());
      //   },
      // },
      {
        "title": "Account",
        "subTitle": "Login & Account Information",
        "iconData": Icons.account_circle_rounded,
        "onTapFunc": () {
          navigation(
              type: "push",
              context: context,
              screen: AccountInformationScreen(
                currentUserInfo: widget.currentUserInfo,
              ));
        },
      },
      {
        "title": "Theme",
        "subTitle": "Set Your Theme",
        "iconData": Icons.color_lens,
        "onTapFunc": () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) => ThemeSettingsScreen(state: state))));
          //     .then((value) {
          //   setState(() {});
          // });
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
            navigation(
              context: context,
              screen: SignInScreen(),
              type: "pushRemove",
            );
          },
          isDisabled: false),
    );
  }
}
