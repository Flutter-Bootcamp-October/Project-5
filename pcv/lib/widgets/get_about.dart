// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/conta_home_widget.dart';

class GetAbout extends StatelessWidget {
   GetAbout(
      {super.key,
      this.id,
      this.name,
      this.email,
      this.titlePosition,
      this.phone,
      this.location,
      this.birthday,
      this.about,
      this.image});
  final String? id;
  final String? name;
  final String? email;
  final String? titlePosition;
  final String? phone;
  final String? location;
  final String? birthday;
  final String? about;
  final String? image;
  final ImagePicker picker = ImagePicker();

  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        children: [
          InkWell(
              onTap: () async {
                try {
                  XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  imageFile = File(image!.path);

                  final Response resp =
                      await netAbout.aboutUploadMethod(image: imageFile!);
                  if (resp.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('image it\'s update')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            (await jsonDecode(resp.body))["msg"].toString())));
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
              child: Container(
                height: 120,
                width: 100,
                color: const Color(0xffff6700),
                child: image == null
                    ? const Center(
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : Image.network(
                        image!,
                        fit: BoxFit.cover,
                      ),
              )),
          Column(
            children: [
              Text(
                ' ${name.toString()}',
                style: const TextStyle(fontSize: 28),
              ),
              if (titlePosition != null &&
                  titlePosition != "null")
                Text(
                  titlePosition.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
            ],
          ),
        ],
      ),
      if (about != null && about != "null")
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(about.toString()),
        ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: email.toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: phone.toString(),
      ),
      if (location != null)
        ContaHomeWidget(
          icon: Icons.location_on,
          text: location.toString(),
        ),
      if (birthday != null)
        ContaHomeWidget(
          icon: Icons.date_range_outlined,
          text: birthday.toString(),
        ),
    ]);
  }
}
