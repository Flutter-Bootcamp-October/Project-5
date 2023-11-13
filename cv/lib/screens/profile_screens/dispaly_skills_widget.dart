import 'package:cv/models/skill.dart';
import 'package:cv/services/skill/get_skills.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';

class DisplayAllSkills extends StatelessWidget {
  const DisplayAllSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSkills(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Skill> skillsList = snapshot.data!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "Skills:",
                    style: TextStyle(
                        fontSize: 16, color: blue, fontWeight: FontWeight.bold),
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
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
