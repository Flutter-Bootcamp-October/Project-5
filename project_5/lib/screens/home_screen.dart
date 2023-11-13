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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late About about;

class _HomeScreenState extends State<HomeScreen> {
  // File? imageGet;
  @override
  void initState() {
    super.initState();
    // get about data to show and update the screen
    //load token
    loadAboutScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar drawer in all pages
      appBar: AppBar(
        leading: InkWell(
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove('token');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello! 👋",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "created date",
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

  loadAboutScreen() async {
    //get about
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    ApiMethods().getAbout(token: token!);

    // final Response res = await ApiMethods().getAbout(token: token!);
    // if (res.statusCode == 200) {
    //   about = (await jsonDecode(res.body))["data"];
    //   setState(() {});
    // }
  }
}

class CategoryContainers extends StatelessWidget {
  const CategoryContainers({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.emoji,
  });
  final String title;
  final Color backgroundColor;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 175,
      width: 165,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(40)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title",
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            emoji,
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
