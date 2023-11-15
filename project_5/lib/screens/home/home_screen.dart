import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/about/about_screen.dart';
import 'package:project_5/screens/auth/signin_screen.dart';
import 'package:project_5/screens/education/education_screen.dart';
import 'package:project_5/screens/project/project_screen.dart';
import 'package:project_5/screens/skill/skill_screen.dart';
import 'package:project_5/screens/social/social_screen.dart';
import 'package:project_5/screens/users/users_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/category_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final apimethod = ApiMethods();

class _HomeScreenState extends State<HomeScreen> {
  // File? imageGet;
  @override
  void initState() {
    super.initState();
    // get about data to show and update the screen
    //load token
    _loadAboutScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar drawer in all pages
      appBar: AppBar(
        leading: InkWell(
            onTap: () async {
              try {
                final SharedPreferences pref =
                    await SharedPreferences.getInstance();
                final token = pref.getString('token');
                // final About res;
                // res = await apimethod.deleteAccount(
                //     token: token!, aboutId: res.data.id.toString());
                pref.remove(token!);
                setState(() {});
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninScreen()));
              } on FormatException catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message.toString())));
              }
            },
            child: const Icon(
              Icons.logout,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // add refresh library to update
            // show all about data here then navigate to each screen (skills, projects, social, education)
            // using a container button and make editing and deleting in these screens

            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello! 👋",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Welcome to CV APP",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  "assets/user.png",
                  height: 55,
                ),
              ],
            ),

            const SizedBox(
              height: 65,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()),
                    );
                  },
                  child: const CategoryContainers(
                    title: 'about me',
                    backgroundColor: Color.fromARGB(148, 68, 137, 255),
                    emoji: "👩🏻",
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EducationScreen()),
                  ),
                  child: const CategoryContainers(
                    title: 'Education',
                    backgroundColor: Color.fromARGB(212, 126, 72, 53),
                    emoji: "🏬",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SkillsScreen()),
                  ),
                  child: const CategoryContainers(
                    title: 'skills',
                    backgroundColor: Color.fromARGB(186, 244, 67, 54),
                    emoji: '⚒',
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectScreen()),
                  ),
                  child: const CategoryContainers(
                    title: 'projects',
                    backgroundColor: Color.fromARGB(179, 3, 191, 22),
                    emoji: "📚",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SocialScreen()),
                    );
                  },
                  child: const CategoryContainers(
                    title: 'Social',
                    backgroundColor: Color.fromARGB(172, 87, 44, 29),
                    emoji: "📱",
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersScreen()),
                  ),
                  child: const CategoryContainers(
                    title: 'Users',
                    backgroundColor: Color.fromARGB(210, 193, 158, 75),
                    emoji: "👨‍👩‍👧‍👦",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _loadAboutScreen() async {
    //get about

    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      final About res = await apimethod.getAbout();
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }
}
