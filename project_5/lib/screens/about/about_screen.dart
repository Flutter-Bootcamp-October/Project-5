import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

//get about data

class _AboutScreenState extends State<AboutScreen> {
  File? imageGet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //image picjer
        if (imageGet != null)
          Image.file(
            imageGet!,
            width: 85,
            height: 85,
          ),

        ElevatedButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            XFile? ImageFile =
                await picker.pickImage(source: ImageSource.gallery);
            imageGet = File(ImageFile!.path);
            setState(() {});

            // call api upload image method
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
      ],
    ));
  }
}
