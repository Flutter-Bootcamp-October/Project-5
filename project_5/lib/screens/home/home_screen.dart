import 'dart:convert';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/screens/about/about_screen.dart';
import 'package:project_5/screens/auth/login_screen.dart';
import 'package:project_5/screens/education/education_screen.dart';
import 'package:project_5/screens/project/project_screen.dart';
import 'package:project_5/screens/skill/skill_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/category_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<About> aboutList = [];
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
                        builder: (context) => const LoginScreen()));
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
            if (aboutList.isEmpty)
              Text("No about data adde information about you"),
            if (aboutList.isNotEmpty)
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello! 👋",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "created date",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Spacer(),

                  Image.asset(
                    "assets/user.png",
                    height: 55,
                  ),
                  // Image.file(
                  //   imageGet?.readAsBytes() as File,
                  //   width: 85,
                  //   height: 85,
                  // ),
                ],
              ),

            const SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  ),
                  child: CategoryContainers(
                    title: 'about me',
                    backgroundColor: Color.fromARGB(176, 68, 137, 255),
                    emoji: "👩🏻",
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EducationScreen()),
                  ),
                  child: CategoryContainers(
                    title: 'Education',
                    backgroundColor: Color.fromARGB(176, 68, 137, 255),
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
                    MaterialPageRoute(builder: (context) => SkillsScreen()),
                  ),
                  child: CategoryContainers(
                    title: 'skills',
                    backgroundColor: Color.fromARGB(176, 68, 137, 255),
                    emoji: '⚒',
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectScreen()),
                  ),
                  child: CategoryContainers(
                    title: 'projects',
                    backgroundColor: Color.fromARGB(176, 68, 137, 255),
                    emoji: "📚",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // call api upload image method

                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    // XFile? ImageFile =
                    //     await picker.pickImage(source: ImageSource.gallery);
                    // imageGet = File(ImageFile!.path);
                    setState(() {});
                  },
                  child: const Text("upload image "),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("edit about "),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("delete account "),
                ),
              ],
            )

            /**
             * profile image
             * 
             * name
             * title position
             *
             * information: phone, location, birthday
             * about paragraph
             * 
             * at the end creat acount date
             */
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
      final About res = await apimethod.getAbout(token: token!);
    } on FormatException catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    }
  }
}
