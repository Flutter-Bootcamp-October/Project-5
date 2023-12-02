import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/add_skill.dart';
import 'package:cv_app/services/skills.dart';
import 'package:cv_app/widgets/title_row.dart';
import 'package:flutter/material.dart';

class SkillScreen extends StatefulWidget {
  const SkillScreen({super.key});

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

class _SkillScreenState extends State<SkillScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Skills"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TitleRow(
              title: "My Skills",
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddSkillScreen()))
                    .then((value) {
                  setState(() {});
                });
              },
            ),
            FutureBuilder(
              future: showSkills(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: mainColor,
                        child: ListTile(
                          leading: const Icon(
                              Icons.precision_manufacturing_outlined,
                              color: Colors.white,
                              size: 30),
                          title: Text("Skill: ${snapshot.data![index].skill}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Delete project'),
                                        content: const Text(
                                            'Sure you want to delete this skill?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              deleteSkill(snapshot
                                                  .data![index].id
                                                  .toString());
                                              Future.delayed(
                                                  const Duration(
                                                      milliseconds: 900), () {
                                                setState(() {});
                                                Navigator.of(context).pop();
                                              });
                                            },
                                            child: const Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Close'),
                                          ),
                                        ],
                                      ));
                            },
                            icon: const Icon(
                              Icons.delete_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: mainColor),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
