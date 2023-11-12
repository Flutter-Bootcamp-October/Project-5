import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5/api_methods/api_methods.dart';
import 'package:project_5/global/globally.dart';
import 'package:project_5/models/about_model.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  final apiMethod = ApiMethods();

  @override
  void initState() {
    //get about data, send token
    super.initState();
  }

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

        if (aboutList.isEmpty)
          const Center(
            child: Text("No about data added"),
          ),

        if (aboutList.isNotEmpty)
          Column(
              children: aboutList
                  .map(
                    (e) => InkWell(
                      onTap: () async {
                        e.data.id;
                        aboutList.remove(e);
                      },
                      child: ListTile(
                        subtitle: Text(e.data.about),
                      ),
                    ),
                  )
                  .toList()),

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
