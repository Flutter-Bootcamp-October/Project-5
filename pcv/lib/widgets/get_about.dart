import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/conta_home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map about = {};

class GetAbout extends StatefulWidget {
  const GetAbout({super.key});

  @override
  State<GetAbout> createState() => _GetAboutState();
}

class _GetAboutState extends State<GetAbout> {
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipOval(
              child: SizedBox(
                  height: 120,
                  width: 120,
                  child: InkWell(
                      onTap: () async {
                        try {
                          XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);
                          imageFile = File(image!.path);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString('token');
                          final Response resp =
                              await netAbout.aboutUploadMethod(
                            token: token!,
                            image: imageFile!,
                          );
                          if (resp.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('image it\'s update')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    (await jsonDecode(resp.body))["msg"]
                                        .toString())));
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (about["image"] == null)
                              const Icon(
                                Icons.person_outline,
                                size: 50,
                              ),
                            if (about["image"] != null)
                              Image.network(about["image"]),
                          ],
                        ),
                      )))),
          Column(
            children: [
              Text(
                ' ${about["name"].toString()}',
                style: const TextStyle(fontSize: 28),
              ),
              if (about["title_position"] != null)
                Text(
                  about["title_position"].toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
            ],
          ),
        ],
      ),
      if (about["about"] != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(about["about"].toString()),
        ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: about["email"].toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: about["phone"].toString(),
      ),
      if (about["location"] != null)
        ContaHomeWidget(
          icon: Icons.location_on,
          text: about["location"].toString(),
        ),
      if (about["birthday"] != null)
        ContaHomeWidget(
          icon: Icons.date_range_outlined,
          text: about["birthday"].toString(),
        ),
    ]);
  }
}
