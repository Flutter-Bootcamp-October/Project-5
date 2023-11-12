import 'dart:io';

import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:cv_app/widgets/information_widget/date_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? selectedImage;
  TextEditingController emailController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  Future pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: 650,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthTextFelid(
                            text: 'Name',
                            icon: null,
                            isHaveIcon: false,
                            controller: emailController,
                          ),
                          AuthTextFelid(
                            text: 'email',
                            icon: null,
                            isHaveIcon: false,
                            controller: emailController,
                          ),
                          AuthTextFelid(
                            text: 'position',
                            icon: null,
                            isHaveIcon: false,
                            controller: emailController,
                          ),
                          AuthTextFelid(
                            text: 'phone Number',
                            icon: null,
                            isHaveIcon: false,
                            controller: emailController,
                          ),
                          AuthTextFelid(
                            text: 'location',
                            icon: null,
                            isHaveIcon: false,
                            controller: emailController,
                          ),
                          height8,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Berthday :',
                                    style: TextStyle(
                                      color: payneGrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    )),
                                height8,
                                DateWidget(
                                  monthController: monthController,
                                  dayController: dayController,
                                  yearController: yearController,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.3,
            top: MediaQuery.of(context).size.height * 0.08,
            child: InkWell(
              onTap: pickImage,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: selectedImage != null
                    ? InkWell(
                        child: Image.file(
                          selectedImage!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Image.asset(
                        'lib/assets/images/image.jpg',
                        width: 150,
                        height: 150,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
