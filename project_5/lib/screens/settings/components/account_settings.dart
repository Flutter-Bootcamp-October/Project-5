// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_5/main.dart';
import 'package:project_5/navigations/navigation_methods.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/auth/sign_in_screen.dart';

import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';
import 'package:project_5/services/about_api.dart';
import 'settings_options.dart';

class AccountInformationScreen extends StatefulWidget {
  const AccountInformationScreen({Key? key, required this.currentUserInfo})
      : super(key: key);

  final currentUserInfo;
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
        "subtitle": '${widget.currentUserInfo.data.name}',
        "onTapFunc": () {
          // customModalBottomSheet(
          //   context,
          //   controller: nameController,
          //   content: "Display Name",
          //   onPressedFunc: () {},
          //   isSkills: false,
          // );
        },
      },
      {
        "title": "Email",
        "subtitle": '${widget.currentUserInfo.data.email}',
        "onTapFunc": () {
          // customModalBottomSheet(
          //   context,
          //   controller: emailController,
          //   content: "Email Address",
          //   onPressedFunc: () {},
          //   isSkills: false,
          // );
        },
      },
      {
        "title": "Phone",
        "subtitle": '${widget.currentUserInfo.data.phone}',
        "onTapFunc": () {
          // customModalBottomSheet(
          //   context,
          //   controller: phoneController,
          //   content: "Phone Number",
          //   onPressedFunc: () {},
          //   isSkills: false,
          // );
        },
      },
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Account Information",
        hasAction: false,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: accountInformationList.length,
              itemBuilder: (context, index) => SettingsOption(
                onTapFunc: accountInformationList[index]['onTapFunc'],
                title: accountInformationList[index]['title'],
                subTitle: accountInformationList[index]['subtitle'],
                isSettings: false,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AuthButton(
          content: "Delete Account",
          color: Colors.grey,
          onPressedFunc: () {
            showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning"),
                    content: Wrap(
                      children: [
                        const Text(
                            "Are you sure you want to delete Your account? All of your data will be deleted\n"),
                        AuthButton(
                            content: "Submit",
                            color: Colors.grey,
                            onPressedFunc: () async {
                              await deleteAccount();
                              pref.cleanToken();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Account deleted successfully")));
                              navigation(
                                context: context,
                                screen:  SignInScreen(),
                                type: "pushRemove",
                              );
                            },
                            isDisabled: false)
                      ],
                    ),
                  );
                });
          },
          isDisabled: false),
    );
  }
}
