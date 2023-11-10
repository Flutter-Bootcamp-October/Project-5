import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/components/auth_text_field.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';

import 'customBottomModalSheet.dart';
import 'settings_options.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key? key}) : super(key: key);

  @override
  State<AccountInformationScreen> createState() =>
      _AccountInformationScreenState();
}

class _AccountInformationScreenState extends State<AccountInformationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<Map> accountInformationList = [
      {
        "title": "User Name",
        "onTapFunc": () {
          customModalBottomSheet(
            context,
            controller: nameController,
            content: "Display Name",
            onPressedFunc: () {},
          );
        },
      },
      {
        "title": "Email",
        "onTapFunc": () {
          customModalBottomSheet(
            context,
            controller: emailController,
            content: "Email Address",
            onPressedFunc: () {},
          );
        },
      },
      {
        "title": "Phone",
        "onTapFunc": () {
          customModalBottomSheet(
            context,
            controller: phoneController,
            content: "Phone Number",
            onPressedFunc: () {},
          );
        },
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Account Information",
        hasAction: false,
      ),
      body: ListView.builder(
        itemCount: accountInformationList.length,
        itemBuilder: (context, index) => SettingsOption(
          onTapFunc: accountInformationList[index]['onTapFunc'],
          title: accountInformationList[index]['title'],
          subTitle: 'my name',
          isSettings: false,
        ),
      ),
    );
  }
}
