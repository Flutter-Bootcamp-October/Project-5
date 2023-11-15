// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/education_model.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:cv_application_api/services/api/education_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:cv_application_api/widgets/profile_widget/update_info_custom_text_field.dart';
import 'package:flutter/material.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  TextEditingController collegeController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController graduationDateController = TextEditingController();
  List<String> level = [
    'school',
    'diploma',
    'Bachelors',
    'Master',
    'Ph.D',
    'other'
  ];
  String? selectedLevel = 'diploma';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            const BackgroundImage(),
            const BackgroundWhiteContainer(),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: app3DarkGreen,
                    size: 30,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TitleOfScreen(
                        title: 'My Education',
                        titleFontSize: 30,
                        titleletterSpacing: 3,
                        titlefontWeight: FontWeight.w300,
                        titleColor: appWhite,
                      ),
                      height20,
                      Container(
                        height: 600,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: app2DarkGreenTrans),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              height14,
                              const TitleOfScreen(
                                title: 'Collage :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: collegeController,
                                hintText: 'Collage name',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'University :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: universityController,
                                hintText: 'University name',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'Specialization :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: specializationController,
                                hintText: 'Your specialty ',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'Level :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              SizedBox(
                                width: 200,
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: appGreenTrans)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: appGreenTrans))),
                                    value: selectedLevel,
                                    items: level
                                        .map(
                                          (element) => DropdownMenuItem<String>(
                                              value: element,
                                              child: Text(element)),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        setState(() => selectedLevel = value)),
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'Graduation Date :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: graduationDateController,
                                hintText: 'MM/DD/YYYY',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 78),
                                child: CustomButtom(
                                  textButtom: 'Save',
                                  onPressed: () async {
                                    try {
                                      if (graduationDateController.text.isEmpty ||
                                          universityController.text.isEmpty ||
                                          specializationController
                                              .text.isEmpty ||
                                          collegeController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Please fill all field"),
                                          ),
                                        );
                                      }

                                      final Education? response =
                                          await postUserEducation(
                                              context: context,
                                              {
                                            "graduation_date":
                                                graduationDateController.text,
                                            "university":
                                                universityController.text,
                                            "college": collegeController.text,
                                            "specialization":
                                                specializationController.text,
                                            "level": selectedLevel.toString()
                                          });

                                      if (response?.codeState == 200) {
                                        print(response?.msg);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return const NavBarScreen();
                                        }));
                                      } else {
                                        showDialog(
                                          context: context,
                                          barrierColor: appcoldGreenTrans,
                                          builder: (context) => const Center(
                                            child: CircularProgressIndicator(
                                              color: app2DarkGreen,
                                            ),
                                          ),
                                        );
                                      }
                                    } catch (error) {
                                      print(error);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(error.toString())));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
