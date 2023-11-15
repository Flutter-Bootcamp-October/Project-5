import 'dart:convert';

import 'package:cv_app/model/about_data.dart';
import 'package:cv_app/model/education_data.dart';
import 'package:cv_app/model/project_data.dart';
import 'package:cv_app/model/project_model.dart';
import 'package:cv_app/model/skills_data.dart';
import 'package:cv_app/model/skills_model.dart';
import 'package:cv_app/model/social_data.dart';
import 'package:cv_app/services/delet.dart';
import 'package:cv_app/services/get.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CvScreen extends StatefulWidget {
  const CvScreen({super.key});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  @override
  Widget build(BuildContext context) {
    // final Get get;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Image.asset(
                "assets/5d1ccdc16221bb0c7013fe999c099aaa.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("ABOUT",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.person_pin,
                            size: 40,
                            color: purble,
                          ),
                        ],
                      ),
                      Divider(
                        color: orang,
                        thickness: 5,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      Text("Reema Ali Alahmari"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.work),
                                      Text("UI/UX Designer"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      Text("Saudi Arabia"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month),
                                      Text("2001/4/18"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      Text("0509623768"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.email),
                                      Text("Reema.alahmari23@gmail.com"),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("EDUCATION",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.cast_for_education_rounded,
                            size: 40,
                            color: purble,
                          ),
                        ],
                      ),
                      Divider(
                        color: orang,
                        thickness: 5,
                      ),
                      FutureBuilder(
                          future: Get().getEducation(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<EducationData> educationList =
                                  snapshot.data!;

                              return Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      for (var element in educationList)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text("University: ",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                  element.university!,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Graduation date: ",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                  element.graduationDate!,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("College: ",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                  element.college!,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Specialization: ",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                  element.specialization!,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Level: ",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Text(
                                                  element.level!,
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            return Container();
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("PROJECT",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.file_open_outlined,
                            size: 40,
                            color: purble,
                          ),
                        ],
                      ),
                      Divider(
                        color: orang,
                        thickness: 5,
                      ),
                      FutureBuilder(
                          future: Get().getProject(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<ProjectData> projectsList =
                                  snapshot.data!;

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  for (var element in projectsList)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons
                                                .fiber_manual_record_sharp),
                                            Text(element.name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(element.description,
                                              style: TextStyle(fontSize: 16)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                            height: 30,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: purble, width: 2)),
                                            child: Center(
                                              child: Text(element.state,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              );
                            }
                            return Container();
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("SKILLS",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.stacked_line_chart_outlined,
                            size: 40,
                            color: purble,
                          ),
                        ],
                      ),
                      Divider(
                        color: orang,
                        thickness: 5,
                      ),
                      FutureBuilder(
                          future: Get().getSkills(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<SkillsData> skillsList =
                                  snapshot.data!;

                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      for (var element in skillsList)
                                        InkWell(
                                          onTap: () async {
                                            final response = await Delete()
                                                .removeSkillsMethod(
                                                    id: element.id.toString());
                                            skillsList.remove(element);

                                            setState(() {});
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons
                                                      .star_purple500_rounded),
                                                  Text(
                                                    element.skill,
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              );
                            }
                            return Container();
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("SOICAL MEDIA",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.contact_emergency_outlined,
                            size: 40,
                            color: purble,
                          ),
                        ],
                      ),
                      Divider(
                        color: orang,
                        thickness: 5,
                      ),
                      FutureBuilder(
                          future: Get().getSocial(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<SocialData> socialList =
                                  snapshot.data!;

                              return Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  for (var element in socialList)
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(element.social!,
                                            style: TextStyle(fontSize: 18)),
                                        Text(":"),
                                        Text(element.username!,
                                            style: TextStyle(fontSize: 18)),
                                      ],
                                    ),
                                ],
                              );
                            }
                            return Container();
                          })
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
