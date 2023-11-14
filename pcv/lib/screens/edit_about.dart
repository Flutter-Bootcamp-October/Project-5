// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/widgets/get_about.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key});

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  TextEditingController usernameController = TextEditingController();
  TextEditingController titPoController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    usernameController.text = about["name"].toString();
    titPoController.text = about["title_position"].toString();
    locationController.text = about["location"].toString();
    phoneController.text = about["phone"].toString();
    aboutController.text = about["about"].toString();
    birthdayController.text = about["birthday"].toString();
    return Scaffold(
        appBar: appBarMethod(title: "Update Information"),
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.pink, Colors.lightBlue])),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (about.isNotEmpty)
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'image it\'s update')));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text((await jsonDecode(
                                                        resp.body))["msg"]
                                                    .toString())));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    TextFieldWidget(
                      text: 'name',
                      obscure: false,
                      controller: usernameController,
                    ),
                    TextFieldWidget(
                      text: 'title Position',
                      obscure: false,
                      controller: titPoController,
                    ),
                    TextFieldWidget(
                      text: 'Phone',
                      obscure: false,
                      controller: phoneController,
                    ),
                    TextFieldWidget(
                      text: 'location',
                      obscure: false,
                      controller: locationController,
                    ),
                    TextFieldWidget(
                      text: 'about',
                      obscure: false,
                      controller: aboutController,
                    ),
                    TextFieldWidget(
                      text: 'birthday',
                      obscure: false,
                      controller: birthdayController,
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        try {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          final token = prefs.getString('token');

                          final Response resp = await netAbout
                              .editAboutMethod(token: token!, body: {
                            "name": usernameController.text,
                            "phone": phoneController.text,
                            "title_position": titPoController.text,
                            "location": locationController.text,
                            "about": aboutController.text,
                            "birthday": birthdayController.text,
                          });
                          about = (await jsonDecode(resp.body))["data"];
                          if (resp.statusCode == 200) {
                            setState(() {
                              about;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
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
                      text: 'Register',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
