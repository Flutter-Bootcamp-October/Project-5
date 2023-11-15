import 'dart:io';
import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/widgets/information_widget/education_expansiontile_widget.dart';
import 'package:cv_app/widgets/information_widget/project_expansiontile_widget.dart';
import 'package:cv_app/widgets/information_widget/skills_ecpansiontile_widget.dart';
import 'package:cv_app/widgets/information_widget/social_media_expansiontile_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({
    super.key,
  });
  @override
  _AddInformationState createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  File? selectedImage;
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
        resizeToAvoidBottomInset: false,
        backgroundColor: richBlack,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  height20,
                  Container(
                    height: 150,
                  ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      height: 650,
                      decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                ProjectExpansionTileWidget(),
                                height20,
                                EducationExpansionTileWidget(),
                                height20,
                                AddSkillsWidget(),
                                height20,
                                AddSocialMediasWidget()
                              ],
                            ),
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
        ));
  }
}
