// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/delete_bloc/delete_bloc.dart';
import 'package:cv/screens/profile_screens/dispaly_info/dispaly_skills_widget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/dispaly_userinfo.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_educations_widget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_projects_wiget.dart';
import 'package:cv/screens/profile_screens/dispaly_info/display_social_widget.dart';
import 'package:cv/screens/profile_screens/settings_screen.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFD),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          "",
        ),
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
            child: Icon(
              Icons.settings,
              color: pink,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Changes position of shadow
                  ),
                ],
                shape: BoxShape.rectangle,
                border: const Border(
                  bottom: BorderSide(
                    style: BorderStyle.none, // Color of the bottom border
                    width: 5.0, // Width of the bottom border
                  ),
                ),
                //borderRadius: BorderRadius.circular(2),
                color: Colors.teal),
          ),
          const Positioned(
            top: -30,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.0,
              ),
              child: DisplayUserInfo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hight14(),
                const DisplayAllSkills(),
                hight14(),
                const DisplayAllSocials(),
                hight14(),
                BlocConsumer<DeleteBloc, DeleteState>(
                  listener: (context, state) {
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            state.massege,
                            style: const TextStyle(color: Colors.black),
                          )));
                    } else if (state is ProjectDeleteState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            "deleted successfully",
                            style: TextStyle(color: Colors.black),
                          )));
                    }
                  },
                  builder: (context, state) {
                    if (state is ProjectDeleteState) {
                      return DisplayAllProject(projects: state.projects);
                    }
                    return DisplayAllProject();
                  },
                ),
                hight14(),
                const DisplayAllEducation(),
                hight40(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
