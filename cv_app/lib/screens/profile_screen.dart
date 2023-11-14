import 'dart:io';
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/screens/loading_screen.dart';
import 'package:cv_app/widgets/auth_widgets/auth_textfelid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cv_app/models/about/about_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/date_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? selectedImage;
  AboutModel? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserInfoMethod();
  }

  Future<void> getUserInfoMethod() async {
    final AboutModel? response = await network.getAboutMethod(context: context);
    if (response != null) {
      setState(() {
        user = response;
        emailController.text = user?.data.email ?? '';
        nameController.text = user?.data.name ?? '';
        positionController.text = user?.data.titlePosition ?? '';
        phoneNumberController.text = user?.data.phone ?? '';
        locationController.text = user?.data.location ?? '';
        aboutController.text = user?.data.about ?? '';
        final dateParts = user?.data.birthday.split('/');
        monthController.text = dateParts?.length == 3 ? dateParts![0] : '';
        dayController.text = dateParts?.length == 3 ? dateParts![1] : '';
        yearController.text = dateParts?.length == 3 ? dateParts![2] : '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: richBlack,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                height20,
                Container(
                  height: 150,
                ),
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
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthTextFelid(
                              text: nameController.text,
                              title: 'Name:',
                              icon: null,
                              isHaveIcon: false,
                              controller: nameController,
                            ),
                            AuthTextFelid(
                              text: aboutController.text,
                              title: 'About me:',
                              icon: null,
                              isHaveIcon: false,
                              controller: aboutController,
                            ),
                            AuthTextFelid(
                              text: emailController.text,
                              title: 'Email',
                              icon: null,
                              isHaveIcon: false,
                              controller: emailController,
                            ),
                            AuthTextFelid(
                              text: positionController.text,
                              icon: null,
                              isHaveIcon: false,
                              title: 'Position',
                              controller: positionController,
                            ),
                            AuthTextFelid(
                              text: phoneNumberController.text,
                              icon: null,
                              isHaveIcon: false,
                              title: 'Phone Number',
                              controller: phoneNumberController,
                            ),
                            AuthTextFelid(
                              text: locationController.text,
                              icon: null,
                              isHaveIcon: false,
                              title: 'Location',
                              controller: locationController,
                            ),
                            height8,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Birthday:',
                                    style: TextStyle(
                                      color: payneGrey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  height8,
                                  DateWidget(
                                    monthController: monthController,
                                    dayController: dayController,
                                    yearController: yearController,
                                  ),
                                  height10,
                                  height10,
                                  Center(
                                    child: ButtonWidget(
                                      onTap: () async {
                                        final result = await network
                                            .updateAboutMethod(body: {
                                          'name': nameController.text,
                                          'title_position':
                                              positionController.text,
                                          'phone': phoneNumberController.text,
                                          'location': locationController.text,
                                          'about': aboutController.text,
                                          'birthday':
                                              '${yearController.text}/${monthController.text}/${dayController.text}',
                                        });
                                      },
                                      name: 'Update',
                                    ),
                                  ),
                                  height10,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Do you want to delete your account?',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: prussianBlue,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final result = await network
                                              .deleteAccountMethod();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoadingScreen()));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: richBlack,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: TextButton(
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          prefs.remove('token');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoadingScreen()));
                                        },
                                        child: Text(
                                          'Signout',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: richBlack,
                                          ),
                                        )),
                                  )
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
      ),
    );
  }
}
