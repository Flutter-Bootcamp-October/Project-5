import 'dart:io';

import 'package:cv_app/screens/project_screen.dart';
import 'package:cv_app/services/post.dart';
import 'package:cv_app/services/put.dart';
import 'package:cv_app/styles/colors.dart';
import 'package:cv_app/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController titcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController loccontroller = TextEditingController();
  TextEditingController birthcontroller = TextEditingController();

  TextEditingController aboutcontroller = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: InkWell(
                        onTap: () async {
                          try {
                            final ImagePicker picker = ImagePicker();
                            XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);

                            final response = await PostAdd().addImage({
                              image: image!,
                            });
                          } on FormatException catch (error) {
                            print("-----");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(error.message.toString())));
                          }
                        },
                        child: Icon(
                          Icons.camera_alt_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Name'),
                      subtitle: TextFormField(
                        controller: namecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Title position'),
                      subtitle: TextFormField(
                        controller: titcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Phone'),
                      subtitle: TextFormField(
                        controller: phonecontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Location'),
                      subtitle: TextFormField(
                        controller: loccontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Birthday'),
                      subtitle: TextFormField(
                        controller: birthcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('About'),
                      subtitle: TextFormField(
                        controller: aboutcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          hintText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomBottom(
                color: orang,
                border: orang,
                text: "Continue",
                ontap: () async {
                  try {
                    final response = await Put().putAbout({
                      "name": namecontroller.text,
                      "title_position": titcontroller.text,
                      "phone": phonecontroller.text,
                      "location": loccontroller.text,
                      "about": aboutcontroller.text,
                      "birthday": birthcontroller.text,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Saved Successfully")));
                  } on FormatException catch (error) {
                    print("-----");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.message.toString())));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
