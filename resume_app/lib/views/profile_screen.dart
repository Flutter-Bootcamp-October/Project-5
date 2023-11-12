import 'package:flutter/material.dart';
import 'package:resume_app/consts/colors.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/project_model.dart';
import 'package:resume_app/services/project_services.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: appBlue,
            onPressed: () {},
            child: const Icon(Icons.picture_as_pdf_sharp),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: 170,
                      height: 180,
                      child: const Text("insert imgae"),
                    ),
                    const Expanded(
                      child: Wrap(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Rafal Abu Eshey",
                            style: TextStyle(
                                fontSize: 33,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  // Shadow(
                                  //     // bottomLeft
                                  //     offset: Offset(-1.5, -1.5),
                                  //     color: appBlue),
                                  Shadow(
                                      // bottomRight
                                      offset: Offset(1.5, -1.5),
                                      color: appBlue),
                                  // Shadow(
                                  //     // topRight
                                  //     offset: Offset(1.5, 1.5),
                                  //     color: appBlue),
                                  Shadow(
                                      // topLeft
                                      offset: Offset(-1.5, 1.5),
                                      color: appBlue),
                                ]),
                          ),
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
