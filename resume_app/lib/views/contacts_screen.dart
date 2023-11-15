import 'package:flutter/material.dart';
import 'package:resume_app/consts/decotation.dart';
import 'package:resume_app/globals/global.dart';
import 'package:resume_app/main.dart';
import 'package:resume_app/models/social_model.dart';
import 'package:resume_app/services/social_services.dart';
import 'package:resume_app/views/signin_screen.dart';
import 'package:resume_app/widgets/app_bg.dart';
import 'package:resume_app/widgets/app_container.dart';
import 'package:resume_app/widgets/social_widget.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => SocialScreenState();
}

class SocialScreenState extends State<SocialScreen> {
  late String token;
  List<String> mediaList = [
    'facebook',
    'youtube',
    'whatsapp',
    'instagram',
    'twitter',
    'tiktok',
    'telegram',
    'snapchat',
    'other'
  ];
  @override
  void initState() {
    token = getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackgroundContainer(),
      const Positioned(
        top: -199,
        right: 99,
        child: BlueContainer(),
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Social Media contacts",
                      style: TextStyle(color: Colors.black, fontSize: 40)),
                  IconButton(
                      onPressed: () async {
                        late Social newSocial;
                        TextEditingController customController =
                            TextEditingController();
                        TextEditingController custom2Controller =
                            TextEditingController();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Add New Social Contacts :"),
                                content: Column(
                                  children: [
                                    TextField(
                                      decoration: returnDec(
                                          hint: "enter user name",
                                          labelText: "Username"),
                                      controller: customController,
                                    ),
                                    const SizedBox(height: 10),
                                    const Wrap(children: [
                                      Text(
                                          "Insert from the following: facebook,youtube, whatsapp, instagram, twitter, tiktok, telegram, snapchat,other")
                                    ]),
                                    const SizedBox(height: 10),
                                    TextField(
                                      decoration: returnDec(
                                          hint: "snapchat",
                                          labelText: "Social"),
                                      controller: custom2Controller,
                                    ),
                                  ],
                                ),
                                actions: [
                                  MaterialButton(
                                    elevation: 5.0,
                                    child: const Text("add"),
                                    onPressed: () async {
                                      if (customController.text.isNotEmpty &&
                                          custom2Controller.text.isNotEmpty) {
                                        if (!mediaList
                                            .contains(custom2Controller.text)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "please choose from the following options only"
                                                          .toString())));
                                        }
                                        try {
                                          newSocial = Social.fromJson({
                                            "username": customController.text,
                                            "social": ""
                                          });
                                          await SocialServ().addSocials(
                                              token: token, account: newSocial);
                                          userSocials = await SocialServ()
                                              .getSocials(token: getToken());
                                          setState(() {});
                                          Navigator.of(context).pop();
                                        } on FormatException catch (error) {
                                          if (error.message
                                                  .toString()
                                                  .contains("token") ||
                                              error.message
                                                  .toString()
                                                  .contains("Token")) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SignInScreen()),
                                                ModalRoute.withName("/screen"));
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(error.message
                                                      .toString())));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "please fill out all required feilds"
                                                        .toString())));
                                      }
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            Center(
              child: Wrap(
                  children: List.generate(userSocials.length,
                      (index) => SocialWidget(social: userSocials[index]))),
            ),
          ]))
    ]);
  }

  String getToken() {
    return prefs.getString("token") ?? "";
  }
}
