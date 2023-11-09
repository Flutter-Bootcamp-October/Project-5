import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';

import 'components/skills.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Profile {UserName}"),
      ),
      body: SizedBox(
        width: context.getWidth(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
              ),
            ),
            Text("{UserName}"),
            Text("{About/Bio}"),
            Row(
              children: [
                Text("{Social Media}"),
                Text("{Social Media}"),
                Text("{Social Media}"),
              ],
            ),
            Divider(thickness: .5, indent: 16, endIndent: 16),
            Skills(),
          ],
        ),
      ),
    );
  }
}
