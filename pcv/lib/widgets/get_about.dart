// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/conta_home_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAbout extends StatefulWidget {
  const GetAbout({super.key,
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
  final  String? name;
  final String? email;
  final String? titlePosition;
  final String? phone;
  final String? location;
  final  String? birthday;
  final String? about;
  final String? image; 
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
                              await netAbout.aboutUploadMethod(image: imageFile!);
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
                        child:
                            widget.image== null?
                              const Center(
                                child: Icon(
                                  Icons.person_outline,
                                  size: 50,
                                ),
                              )
                           :
                              Image.network(widget.image!),
                      )))),
          Column(
            children: [
              Text(
                ' ${widget.name.toString()}',
                style: const TextStyle(fontSize: 28),
              ),
              if (widget.titlePosition != null)
                Text(
                  widget.titlePosition.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
            ],
          ),
        ],
      ),
      if (widget.about != null)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(widget.about.toString()),
        ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: widget.email.toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: widget.phone.toString(),
      ),
      if (widget.location != null)
        ContaHomeWidget(
          icon: Icons.location_on,
          text: widget.location.toString(),
        ),
      if (widget.birthday != null)
        ContaHomeWidget(
          icon: Icons.date_range_outlined,
          text: widget.birthday.toString(),
        ),
    ]);
  }
}
