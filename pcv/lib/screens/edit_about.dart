// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/method/app_bar_mathod.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/services/api_about.dart';
import 'package:pcv/screens/home_screen.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class EditAboutScreen extends StatefulWidget {
  const EditAboutScreen({super.key});

  @override
  State<EditAboutScreen> createState() => _EditAboutScreenState();
}

class _EditAboutScreenState extends State<EditAboutScreen> {
  AboutModel? aboutData;
  bool check=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingAbout();
    Future.delayed(const Duration(seconds: 2),() {
      check = false;
      usernameController.text =aboutData!.data!.name.toString();
      titPoController.text = aboutData!.data!.titlePosition.toString();
      locationController.text = aboutData!.data!.location.toString();
      phoneController.text = aboutData!.data!.phone.toString();
      aboutController.text = aboutData!.data!.about.toString();
      birthdayController.text = aboutData!.data!.birthday.toString();
      setState(() {
      });
    });
  }
  loadingAbout()async{
    aboutData=await netAbout.aboutMethod(context: context);
    setState(() {
    });
  }
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  final usernameController = TextEditingController();
  final titPoController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();
  final aboutController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: appBarMethod(title: "Update Information"),
        resizeToAvoidBottomInset: true,
        body: check?const Center(child: CircularProgressIndicator(),) :SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        final Response resp = await netAbout
                            .editAboutMethod(body: {
                          "name": usernameController.text,
                          "phone": phoneController.text,
                          "title_position": titPoController.text,
                          "location": locationController.text,
                          "about": aboutController.text,
                          "birthday": birthdayController.text,
                        });
                        if (resp.statusCode == 200) {
                          setState(() {
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
        ));
  }
}
