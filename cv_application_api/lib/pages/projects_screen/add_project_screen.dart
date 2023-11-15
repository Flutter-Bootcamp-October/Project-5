// ignore_for_file: use_build_context_synchronously

import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/project_model.dart';
import 'package:cv_application_api/pages/navbar_screen.dart';
import 'package:cv_application_api/services/api/project_api.dart';
import 'package:cv_application_api/widgets/background_widget/background_image.dart';
import 'package:cv_application_api/widgets/background_widget/background_white_container.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/custom_buttom.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:cv_application_api/widgets/profile_widget/update_info_custom_text_field.dart';
import 'package:flutter/material.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  TextEditingController nameProjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  List<String> level = ['processing', 'completed', 'other'];
  String? selectedLevel = 'completed';

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
                      Container(
                        height: 450,
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
                              const TitleOfScreen(
                                title: 'Add Project',
                                titleFontSize: 30,
                                titleletterSpacing: 3,
                                titlefontWeight: FontWeight.w300,
                                titleColor: app3DarkGreen,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'Project name :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: nameProjectController,
                                hintText: 'Project name',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'Description :',
                                titleFontSize: 18,
                                titleletterSpacing: 0,
                                titlefontWeight: FontWeight.w300,
                                titleColor: appWhite,
                              ),
                              height4,
                              UpdateInfoCustomTextField(
                                textController: descriptionController,
                                hintText: 'Description',
                                obscureText: false,
                                keyboardType: TextInputType.name,
                              ),
                              height14,
                              const TitleOfScreen(
                                title: 'State :',
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
                              Padding(
                                padding: const EdgeInsets.only(top: 30, left: 78),
                                child: CustomButtom(
                                  textButtom: 'Save',
                                  onPressed: () async {
                                    try {
                                      if (nameProjectController.text.isEmpty ||
                                          descriptionController.text.isEmpty ||
                                          stateController.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text("Please fill all field"),
                                          ),
                                        );
                                      }

                                      final Project? response =
                                          await postUserProject(
                                              context: context,
                                              {
                                            "name": nameProjectController.text,
                                            "description":
                                                descriptionController.text,
                                            "state": selectedLevel
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
