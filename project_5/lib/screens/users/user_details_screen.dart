import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/users_model.dart';
import 'package:project_5/screens/profile/components/section_title.dart';
import 'package:project_5/screens/reusable_widgets/custom_app_bar.dart';

class UsersDetailsScreen extends StatelessWidget {
  const UsersDetailsScreen({Key? key, required this.userModel})
      : super(key: key);

  final Data userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${userModel.name} Profile",
        hasAction: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.getWidth(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                foregroundImage: userModel.image != null
                    ? NetworkImage(userModel.image!)
                    : NetworkImage(placeHolderImage),
              ),
              Text("${userModel.name}"),
              Text(userModel.about ?? "User has no Bio"),
              Text("${userModel.email}"),
              const Divider(),
              SectionTitle(
                  title: "Education",
                  iconData: Icons.school,
                  onPressedFunc: () {}),
              ...userModel.education!.map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e.university?.toUpperCase()}"),
                            Text("${e.graduationDate}"),
                            Text("${e.level} of ${e.specialization}"),
                          ],
                        ),
                      ),
                      const Divider(endIndent: 20, indent: 20),
                    ],
                  )),
              SectionTitle(
                  title: "Skills",
                  iconData: Icons.rocket_launch,
                  onPressedFunc: () {}),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    ...userModel.skills!
                        .map((e) => Text("${e.skill}, "))
                        .toList(),
                  ],
                ),
              ),
              const Divider(),
              SectionTitle(
                  title: "Projects",
                  iconData: Icons.note_alt,
                  onPressedFunc: () {}),
              ...userModel.projects!.map((e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e.name?.toUpperCase()}"),
                            Text("${e.description}"),
                            Text("${e.state}"),
                          ],
                        ),
                      ),
                      const Divider(endIndent: 20, indent: 20),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
