import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/main.dart';
import 'package:cv_app/screens/login_screen.dart';
import 'package:cv_app/services/about.dart';
import 'package:cv_app/services/skills.dart';
import 'package:flutter/material.dart';

class MyCVScreen extends StatefulWidget {
  const MyCVScreen({super.key});

  @override
  State<MyCVScreen> createState() => _MyCVScreenState();
}

class _MyCVScreenState extends State<MyCVScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: showAbout(),
                      builder: ((context, snapshot) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.id == null) {
                            prefs.remove("token");
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Column(
                              children: [
                                Center(
                                  child: snapshot.data!.image == null
                                      ? ClipOval(
                                          child: Image.asset(
                                              "assets\\defualt_img.png",
                                              scale: 5))
                                      : ClipOval(
                                          child: Image.network(
                                            snapshot.data!.image.toString(),
                                            scale: 5,
                                          ),
                                        ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Contact",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets\\whatsapp.png",
                                      scale: 25,
                                    ),
                                    Text(
                                      "${snapshot.data!.phone}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(color: mainColor),
                          );
                        }
                      }),
                    ),
                    FutureBuilder(
                      future: showSkills(),
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Column(
                            children: [
                              const Text(
                                "Skills",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(
                                            Icons.stacked_bar_chart,
                                            color: Colors.white,
                                            size: 20),
                                        title: Text(
                                          "${snapshot.data![index].skill}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: showAbout(),
                  builder: ((context, snapshot) {
                    if (snapshot.data != null) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${snapshot.data!.name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                "${snapshot.data!.titlePosition}",
                                style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2,
                                width: 180,
                                color: mainColor,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: mainColor),
                      );
                    }
                  }),
                ),
                const Text(
                  "   About me",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                    future: showAbout(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return Text("    ${snapshot.data!.about}");
                      } else {
                        return const Center();
                      }
                    })),
                const SizedBox(height: 24),
                const Text(
                  "   Projects",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                const Text(
                  "   Education",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
