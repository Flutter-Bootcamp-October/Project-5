// ignore_for_file: use_build_context_synchronously

import 'package:cv/screens/auth_screens/signin_screen.dart';
import 'package:cv/services/skill/get_skills.dart';
import 'package:cv/services/social/get_social.dart';
import 'package:cv/services/user/about.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: aboutAPI(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(child: Text(snapshot.data!.email!));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            FutureBuilder(
                future: getsocials(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 120,
                          width: 50,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].username ?? "",
                                    overflow: TextOverflow.fade,
                                    maxLines: 3,
                                  ),
                                ),
                                Text(snapshot.data![index].id.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("error"));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            FutureBuilder(
                future: getSkills(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 120,
                          width: 50,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data![index].skill ?? "",
                                    overflow: TextOverflow.fade,
                                    maxLines: 3,
                                  ),
                                ),
                                Text(snapshot.data![index].id.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("error"));
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            // FutureBuilder(
            //     future: getProjects(context),
            //     builder: (context, snapshot) {
            //       List<Project> projectsList = snapshot.data!;
            //       if (snapshot.hasData) {
            //         return Center(
            //             child: Text(projectsList.first.id!.toString()));
            //       } else {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //     }),
            IconButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("token");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SigninScreen(),
                      ),
                      (route) => false);
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}
