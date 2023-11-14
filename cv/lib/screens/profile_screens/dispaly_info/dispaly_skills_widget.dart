import 'dart:convert';

import 'package:cv/models/skill.dart';
import 'package:cv/services/skill/delete_skill.dart';
import 'package:cv/services/skill/get_skills.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class DisplayAllSkills extends StatefulWidget {
  const DisplayAllSkills({super.key});

  @override
  State<DisplayAllSkills> createState() => _DisplayAllSkillsState();
}

class _DisplayAllSkillsState extends State<DisplayAllSkills> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSkills(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Skill> skillsList = snapshot.data!;

            return skillsList.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "Skills:",
                          style: TextStyle(
                              fontSize: 16,
                              color: blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: skillsList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Chip(
                                    onDeleted: () async {
                                      try {
                                        final response = await deleteSkill(
                                            context,
                                            {"id_skill": skillsList[index].id});
                                        if (response != null &&
                                            response.statusCode >= 200 &&
                                            response.statusCode < 300) {
                                          setState(() {});

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "deleted successfully")));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(jsonDecode(
                                                      response!.body)["msg"])));
                                        }
                                      } catch (error) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text(error.toString())));
                                      }
                                    },
                                    backgroundColor: lightBlue,
                                    // avatar: logo,
                                    label: Text(
                                      skillsList[index].skill ?? "",
                                    ),
                                  ),
                                  width14(),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : const Text("");
          } else if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
