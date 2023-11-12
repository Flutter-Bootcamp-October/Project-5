// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cv/services/social/add_social.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SocilaScreen extends StatefulWidget {
  const SocilaScreen({super.key});

  @override
  State<SocilaScreen> createState() => _SocilaScreenState();
}

class _SocilaScreenState extends State<SocilaScreen> {
  String type = "Income";
  TextEditingController socialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add New Social Media",
                    style: TextStyle(
                        fontSize: 25, color: blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: AddTextField(
                      label: 'Username',
                      hint: 'Enter Username',
                      isPassword: false,
                      controller: socialController,
                      icon: Icons.phone_android_rounded,
                    ),
                  ),
                ],
              ),
              hight16(),
              Padding(
                padding: const EdgeInsets.only(left: 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hight8(),
                    Text(
                      "Choose social media type:",
                      style: TextStyle(fontSize: 16, color: blue),
                    ),
                    hight8(),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Facebook"),
                        value: "facebook",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "facebook";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Youtube"),
                        value: "youtube",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "youtube";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Whatsapp"),
                        value: "whatsapp",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "whatsapp";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Instagram"),
                        value: "instagram",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "instagram";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Twitter"),
                        value: "twitter",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "twitter";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Tiktok"),
                        value: "tiktok",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "tiktok";
                          });
                        },
                        dense: true),
                    RadioListTile(
                        fillColor: MaterialStateProperty.all(lightOrange),
                        activeColor: lightOrange,
                        title: const Text("Telegram"),
                        value: "telegram",
                        groupValue: type,
                        onChanged: (value) {
                          setState(() {
                            type = "telegram";
                          });
                        },
                        dense: true),
                  ],
                ),
              ),
              hight20(),
              Center(
                child: InkWell(
                  onTap: () async {
                    try {
                      if (socialController.text.isNotEmpty) {
                        final response = await addSocial(context, {
                          "username": socialController.text,
                          "social": type
                        });
                        if (response != null) {
                          if (response.statusCode >= 200 &&
                              response.statusCode < 300) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Social Media is added successfully")));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text(jsonDecode(response.body)["msg"])));
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please enter all information")));
                      }
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())));
                    }
                  },
                  child: Container(
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: pink),
                    child: const Center(
                      child: Text(
                        "Add Social",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
