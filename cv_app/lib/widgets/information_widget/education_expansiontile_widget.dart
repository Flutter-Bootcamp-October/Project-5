import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/education/education_data_model.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/date_widget.dart';
import 'package:cv_app/widgets/information_widget/textfiled_widget.dart';
import 'package:cv_app/widgets/information_widget/universitydropdown_widget.dart';
import 'package:flutter/material.dart';

class EducationExpansionTileWidget extends StatefulWidget {
  const EducationExpansionTileWidget({
    super.key,
  });

  @override
  State<EducationExpansionTileWidget> createState() =>
      _EducationExpansionTileWidgetState();
}

class _EducationExpansionTileWidgetState
    extends State<EducationExpansionTileWidget> {
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  late String university = '';
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  String level = '';
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: lightGrey,
      collapsedBackgroundColor: lightGrey,
      iconColor: prussianBlue,
      collapsedIconColor: prussianBlue,
      title: const Text(
        'Education',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: prussianBlue,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: educationList.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UniversityDropDownMenu(
                            title: 'University name',
                            hintTitle: 'University name',
                            onChanged: (value) {
                              educationList[index].university = value;
                              university = value;
                            },
                          ),
                          height10,
                          TextFelidWidget(
                            hintTitle: 'College name',
                            title: 'College name',
                            controller: collegeController,
                            onChanged: (value) {
                              educationList[index].college = value;
                              collegeController.text = value;
                            },
                          ),
                          height10,
                          TextFelidWidget(
                            hintTitle: 'Specialization',
                            title: 'Specialization',
                            controller: specializationController,
                            onChanged: (value) {
                              educationList[index].specialization = value;
                              specializationController.text = value;
                            },
                          ),
                          height10,
                          TextFelidWidget(
                            hintTitle: 'Level',
                            title: 'Level',
                            controller: levelController,
                            onChanged: (value) {
                              educationList[index].level = value;
                              levelController.text = value;
                            },
                          ),
                          height10,
                          DateWidget(
                              monthController: monthController,
                              dayController: dayController,
                              yearController: yearController),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  if (educationList.isEmpty)
                    ButtonWidget(
                      onTap: () async {
                        String month = monthController.text;
                        String day = dayController.text;
                        String year = yearController.text;
                        setState(() {
                          educationList.add(EducationData(
                            graduationDate: '',
                            university: '',
                            college: '',
                            specialization: '',
                            level: '',
                          ));
                        });
                      },
                      name: 'Add Education',
                    ),
                  if (educationList.isNotEmpty)
                    ButtonWidget(
                        onTap: () async {
                          String month = monthController.text;
                          String day = dayController.text;
                          String year = yearController.text;
                          final result = await network.addEducationMethod(
                            body: {
                              "graduation_date": '$month/$day/$year',
                              "university": university,
                              "college": collegeController.text,
                              "specialization": specializationController.text,
                              "level": levelController.text
                            },
                          );
                        },
                        name: 'Send Education')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
