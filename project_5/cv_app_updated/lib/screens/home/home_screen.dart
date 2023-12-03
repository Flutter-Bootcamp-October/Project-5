import 'package:flutter/material.dart';
import 'package:project_5/api_methods/user_delete.dart';
import 'package:project_5/api_methods/user_get_methods.dart';
import 'package:project_5/api_methods/user_post_methods.dart';
import 'package:project_5/blocs/delete/bloc/delete_bloc.dart';
import 'package:project_5/main.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/screens/about/about_screen.dart';
import 'package:project_5/screens/auth/signin_screen.dart';
import 'package:project_5/screens/education/education_screen.dart';
import 'package:project_5/screens/project/project_screen.dart';
import 'package:project_5/screens/skill/skill_screen.dart';
import 'package:project_5/screens/social/social_screen.dart';
import 'package:project_5/screens/users/users_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/category_containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final getMethods = UserNetworkingMethods();
final deleteMethods = UserDeleteMethods();
final addMethods = PostUserMethodNetworking();

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;
  Future chooseImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () async {
              context
                  .read<DeleteBloc>()
                  .add(DeleteUserEvent(id: pref!.getString("token")!));
            },
            child: BlocListener<DeleteBloc, DeleteState>(
              listener: (context, state) {
                if (state is DeleteUserState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SigninScreen()));
                } else if (state is DeleteErrorState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    //context.read<PostBloc>().add(PostImageEvent()),
                    onTap: chooseImage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: selectedImage != null
                          ? InkWell(
                              child: Image.file(
                                selectedImage!,
                                height: 75,
                                fit: BoxFit.fill,
                              ),
                            )
                          : Image.asset(
                              "assets/user.png",
                              height: 75,
                            ),
                    )),
                const Text(
                  "Hello! 👋",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
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
}
