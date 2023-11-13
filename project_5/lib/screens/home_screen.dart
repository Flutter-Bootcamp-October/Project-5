import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // File? imageGet;
  @override
  void initState() {
    // get about data to show and update the screen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar drawer in all pages
      appBar: AppBar(
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
                    Text("Hello NAME! 👋"),
                    Text("ADD CREATED DATE"),
                  ],
                ),
                const Spacer(),
                // Image.file(
                //   imageGet?.readAsBytes() as File,
                //   width: 85,
                //   height: 85,
                // ),
              ],
            ),

            SizedBox(
              height: 50,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryContainers(
                  title: 'about me',
                  backgroundColor: Color.fromARGB(176, 68, 137, 255),
                ),
                CategoryContainers(
                  title: 'Education',
                  backgroundColor: Color.fromARGB(176, 68, 137, 255),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryContainers(
                  title: 'skills',
                  backgroundColor: Color.fromARGB(176, 68, 137, 255),
                ),
                CategoryContainers(
                  title: 'projects',
                  backgroundColor: Color.fromARGB(176, 68, 137, 255),
                ),
              ],
            ),
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
              child: const Text("delete about "),
            ),

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
}

class CategoryContainers extends StatelessWidget {
  const CategoryContainers({
    super.key,
    required this.title,
    required this.backgroundColor,
  });
  final String title;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 175,
      width: 165,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(35)),
      child: Text(
        "$title",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
