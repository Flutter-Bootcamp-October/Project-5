import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/screens/education_screen.dart';
import 'package:cv_app/screens/project_screen.dart';
import 'package:cv_app/screens/skills_screen.dart';
import 'package:cv_app/screens/social_screen.dart';
import 'package:cv_app/widgets/connect_with.dart';
import 'package:cv_app/widgets/fill_cv.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications,
                    color: mainColor,
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: midColor, borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets\\cv.png",
                      scale: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        "Generate a curriculum vitae\nusing the MyCV app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Fill your CV: ",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FillCV(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProjectScreen(),
                          ),
                        );
                      },
                      text: "Projects",
                      icon: Icons.work),
                  FillCV(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SkillScreen(),
                          ),
                        );
                      },
                      text: "Skills",
                      icon: Icons.precision_manufacturing),
                  FillCV(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SocialScreen(),
                          ),
                        );
                      },
                      text: "Social",
                      icon: Icons.connect_without_contact),
                  FillCV(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EducationScreen(),
                          ),
                        );
                      },
                      text: "Education",
                      icon: Icons.school),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Share with: ",
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const ConnectWith(
                image: "assets\\linked_in.png", text: "Linked in"),
            const ConnectWith(image: "assets\\whatsapp.png", text: "WhatsApp"),
          ],
        ),
      ),
    );
  }
}
