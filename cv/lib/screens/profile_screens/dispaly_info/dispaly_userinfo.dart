import 'dart:convert';
import 'dart:io';

import 'package:cv/screens/profile_screens/edit_user.dart';
import 'package:cv/screens/profile_screens/home_screen.dart';
import 'package:cv/services/user/about.dart';
import 'package:cv/services/user/upload_image.dart';
import 'package:cv/style/sizes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DisplayUserInfo extends StatefulWidget {
  const DisplayUserInfo({super.key});

  @override
  State<DisplayUserInfo> createState() => _DisplayUserInfoState();
}

class _DisplayUserInfoState extends State<DisplayUserInfo> {
  File? importImage;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: aboutAPI(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.89,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(69, 0, 0, 0)),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(35),
                        color: const Color.fromARGB(22, 0, 0, 0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                try {
                                  final ImagePicker picker = ImagePicker();
                                  XFile? imageFile = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (imageFile == null) {
                                    // User canceled image selection
                                    return;
                                  }
                                  importImage = File(imageFile.path);

                                  if (importImage != null &&
                                      await importImage!.exists()) {
                                    var bytes =
                                        await importImage?.readAsBytes();
                                    print(bytes.toString());
                                    final response =
                                        await uploadImage(context, bytes);
                                    if (response != null &&
                                        response.statusCode >= 200 &&
                                        response.statusCode < 300) {
                                      setState(() {
                                        Future.delayed(
                                            const Duration(seconds: 5));
                                      });
                                      context
                                          .findAncestorStateOfType<
                                              HomeScreenState>()!
                                          .setState(() {
                                        Future.delayed(
                                            const Duration(seconds: 5));
                                      });
                                      print("-------------");
                                      print(snapshot.data!.image);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "the photo is updated successfully")));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(jsonDecode(
                                                  response!.body)["msg"])));
                                    }
                                  } else {
                                    print(
                                        'Image file does not exist or is null.');
                                  }
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(error.toString())));
                                }
                              },
                              child: SizedBox(
                                width: 100,
                                height: 100,
                                child: snapshot.data!.image != null
                                    ? Image.network(snapshot.data!.image!)
                                    : Image.asset("assets/tiktok.png"),
                              ),
                            ),
                            // if (importImage != null)
                            //   Image.file(importImage!, height: 200, width: 200),
                            // const Text(
                            //   "Name:",
                            //   style: TextStyle(fontWeight: FontWeight.w500),
                            // ),
                            Text(
                              snapshot.data!.name ?? "",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            hight14(),
                            const Text("Phone: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.phone ?? "",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            hight14(),
                            const Text("Email: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.email ?? "",
                            ),
                            hight14(),
                            const Text("Title Position: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.titlePosition ?? "",
                            ),
                            hight14(),
                            const Text("Location: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.location ?? "",
                            ),
                            hight14(),
                            const Text("Birthday: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.birthday ?? "",
                            ),
                            hight14(),
                            const Text("About: ",
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text(
                              snapshot.data!.about ?? "",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 300,
                        top: 20,
                        child: InkWell(
                            onTap: () async {
                              final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditUserScreen(
                                            user: snapshot.data!,
                                          )));
                              if (result != null && result == true) {
                                setState(() {});
                              }
                            },
                            child: const Icon(Icons.edit)))
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("error"));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
