import 'package:cv_app/screens/social_screen.dart';
import 'package:cv_app/services/post.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';

class SkillsScreen extends StatefulWidget {
  const SkillsScreen({super.key});

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  TextEditingController scontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  ListTile(
                    title: Text('The Skill Name'),
                    subtitle: TextFormField(
                      controller: scontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomBottom(
                color: orang,
                ontap: () async {
                  try {
                    final response =
                        await PostAdd().addSkills({"skill": scontroller.text});
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Saved Successfully")));
                  } on FormatException catch (error) {
                    print("-----");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message.toString())));
                  }
                },
                border: orang,
                text: "Continue")
          ],
        ),
      ),
    );
  }
}
