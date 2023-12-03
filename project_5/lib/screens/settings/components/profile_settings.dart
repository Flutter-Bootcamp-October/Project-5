import 'package:flutter/material.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Profile Settings",
        hasAction: false,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
