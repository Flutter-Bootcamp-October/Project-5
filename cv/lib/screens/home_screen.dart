import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/about_me_screen.dart';
import 'package:cv/screens/community_screen.dart';
import 'package:cv/screens/education_screen.dart';
import 'package:cv/screens/project_screen.dart';
import 'package:cv/widgets/home_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: HomeCard(
                title: "About me",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutMe()),
                  );
                },
              ),
            ),
            height20,
            HomeCard(
                title: "Education",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Education()),
                  );
                }),
            height20,
            HomeCard(
              title: "Project",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Project()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 200),
              child: FloatingActionButton.extended(
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Community()),
                  );
                },
                label: const Text("Community"),
                icon: const Icon(Icons.person_search_outlined),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
