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

  @override
  Widget build(BuildContext context) {
    TextEditingController socialController = TextEditingController();

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
                    "Add New Social",
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
                      "Choose social type:",
                      style: TextStyle(fontSize: 16, color: blue),
                    ),
                    hight8(),
                    RadioListTile(
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
                  onTap: () async {},
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
