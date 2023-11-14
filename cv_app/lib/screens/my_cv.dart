import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/education.dart';
import 'package:cv_app/services/project.dart';
import 'package:cv_app/services/skills.dart';
import 'package:cv_app/services/social.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:cv_app/widgets/title_row.dart';
import 'package:flutter/material.dart';

class MyCVScreen extends StatefulWidget {
  const MyCVScreen({super.key});

  @override
  State<MyCVScreen> createState() => _MyCVScreenState();
}

class _MyCVScreenState extends State<MyCVScreen> {
  TextEditingController nameController = TextEditingController(),
      descriptionController = TextEditingController(),
      skillController = TextEditingController(),
      socialController = TextEditingController(),
      usernameController = TextEditingController(),
      graduationDateController = TextEditingController(),
      universityController = TextEditingController(),
      collegeController = TextEditingController(),
      specializationController = TextEditingController(),
      levelController = TextEditingController(),
      stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.color_lens, color: mainColor),
                Icon(Icons.design_services_outlined, color: mainColor),
                Icon(Icons.save_alt_rounded, color: mainColor)
              ],
            ),
            const Divider(),
            TitleRow(
                title: "Projects",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            AppTextField(
                                label: "Name",
                                icon: Icons.dynamic_feed_rounded,
                                controller: nameController),
                            AppTextField(
                                label: "description",
                                icon: Icons.notes_rounded,
                                controller: descriptionController),
                            AppTextField(
                                label: "state",
                                icon: Icons.stacked_line_chart_sharp,
                                controller: stateController),
                            AppBotton(
                              text: "Add",
                              onTap: () async {
                                final response = await addProject(
                                    name: nameController.text,
                                    description: descriptionController.text,
                                    state: stateController.text);
                                if (response['codeState'] == 200) {
                                  nameController.text = "";
                                  descriptionController.text = "";
                                  stateController.text = "";
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(response['msg'].toString())),
                                  );
                                }
                              },
                            )
                          ],
                        );
                      }).then((value) {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {});
                    });
                  });
                }),
            FutureBuilder(
                future: showProjects(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: mainColor,
                            child: ListTile(
                              leading: Text(
                                snapshot.data![index].id.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(snapshot.data![index].name.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      snapshot.data![index].description
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      )),
                                  Text(
                                    snapshot.data![index].state.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteProject(
                                        snapshot.data![index].id.toString());
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {});
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.delete_rounded,
                                    color: Colors.white,
                                  )),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: mainColor));
                  }
                }),
            TitleRow(
                title: "Skills",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            AppTextField(
                                label: "Skill",
                                icon: Icons.pages_rounded,
                                controller: skillController),
                            AppBotton(
                              text: "Add",
                              onTap: () async {
                                final response =
                                    await addSkill(skill: skillController.text);
                                if (response['codeState'] == 200) {
                                  skillController.text = "";
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(response['msg'].toString())),
                                  );
                                }
                              },
                            )
                          ],
                        );
                      }).then((value) {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {});
                    });
                  });
                }),
            FutureBuilder(
                future: showSkills(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 30,
                            decoration: const BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data![index].skill.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteSkill(
                                          snapshot.data![index].id.toString());
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        setState(() {});
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: mainColor));
                  }
                }),
            TitleRow(
                title: "Socials",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            AppTextField(
                                label: "social",
                                icon: Icons.connect_without_contact,
                                controller: socialController),
                            AppTextField(
                                label: "username",
                                icon: Icons.dynamic_feed,
                                controller: usernameController),
                            AppBotton(
                              text: "Add",
                              onTap: () async {
                                final response = await addSocial(
                                    username: usernameController.text,
                                    social: socialController.text);
                                if (response['codeState'] == 200) {
                                  socialController.text = "";
                                  usernameController.text = "";
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(response['msg'].toString())),
                                  );
                                }
                              },
                            )
                          ],
                        );
                      }).then((value) {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {});
                    });
                  });
                }),
            FutureBuilder(
                future: showSocial(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Container(
                            height: 30,
                            decoration: const BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${snapshot.data![index].social}: @${snapshot.data![index].username}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteSocial(
                                          snapshot.data![index].id.toString());
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        setState(() {});
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: mainColor));
                  }
                }),
            TitleRow(
                title: "Education",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            AppTextField(
                                label: "graduation_date",
                                icon: Icons.date_range_outlined,
                                controller: graduationDateController),
                            AppTextField(
                                label: "univercity",
                                icon: Icons.school_rounded,
                                controller: universityController),
                            AppTextField(
                                label: "college",
                                icon: Icons.school_outlined,
                                controller: collegeController),
                            AppTextField(
                                label: "specialization",
                                icon: Icons.workspace_premium_rounded,
                                controller: specializationController),
                            AppTextField(
                                label: "level",
                                icon: Icons.straighten_outlined,
                                controller: levelController),
                            AppBotton(
                              text: "Add",
                              onTap: () async {
                                final response = await addEducation(
                                    graduationDate:
                                        graduationDateController.text,
                                    university: universityController.text,
                                    college: collegeController.text,
                                    specialization:
                                        specializationController.text,
                                    level: levelController.text);
                                if (response['codeState'] == 200) {
                                  graduationDateController.text = "";
                                  universityController.text = "";
                                  collegeController.text = "";
                                  specializationController.text = "";
                                  levelController.text = "";
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(response['msg'].toString())),
                                  );
                                }
                              },
                            )
                          ],
                        );
                      }).then((value) {
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {});
                    });
                  });
                }),
            FutureBuilder(
                future: showEducation(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        return Container(
                            height: 30,
                            decoration: const BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${snapshot.data![index].university}, ${snapshot.data![index].college}, ${snapshot.data![index].specialization}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteEducation(
                                          snapshot.data![index].id.toString());
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        setState(() {});
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: mainColor));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
