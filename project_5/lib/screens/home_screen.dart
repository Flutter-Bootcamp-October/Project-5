import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageGet;
  @override
  void initState() {
    // get about data to show and update the screen
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar drawer in all pages
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // add refresh library to update
            // show all about data here then navigate to each screen (skills, projects, social, education)
            // using a container button and make editing and deleting in these screens

            Row(
              children: [
                Column(
                  children: [
                    Text("Hello NAME! 👋"),
                    Text("ADD CREATED DATE"),
                  ],
                ),
                Spacer(),
                Image.file(
                  imageGet!.readAsBytes() as File,
                  width: 85,
                  height: 85,
                ),
              ],
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                  borderRadius: BorderRadius.circular(35)),
              child: const Text("about me"),
            ),
            // call api upload image method
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                XFile? ImageFile =
                    await picker.pickImage(source: ImageSource.gallery);
                imageGet = File(ImageFile!.path);
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
