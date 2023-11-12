import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/screens/verification_screen.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/app_text_filed.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/education_card.dart';
import 'package:cv/widgets/main_text.dart';
import 'package:cv/widgets/project_card.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  Education({super.key});

  TextEditingController specializationController = TextEditingController(),
      universtyController = TextEditingController(),
      collegeController = TextEditingController(),
      levelController = TextEditingController(),
      graduationDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width - 300),
                        child: const Text(
                          "Education",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      AddNewButton(
                        color: Colors.white,
                        iconColor: Colors.white,
                        title: "Add new",
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(8))),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, top: 64),
                                    child: Column(
                                      children: [
                                        const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Add new education",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        BottomSheetFiled(
                                          controller: specializationController,
                                          lable: "Specialization",
                                        ),
                                        BottomSheetFiled(
                                          controller: universtyController,
                                          lable: "Universty Name",
                                        ),
                                        BottomSheetFiled(
                                          controller: collegeController,
                                          lable: "College Name",
                                        ),
                                        BottomSheetFiled(
                                          controller: levelController,
                                          lable: "level",
                                        ),
                                        BottomSheetFiled(
                                          controller: graduationDateController,
                                          lable: "Graduation Date",
                                        ),
                                        Appbutton(
                                            onpressed: () {},
                                            btnColor: AppColors.primaryColor,
                                            title: "Add",
                                            titleColor: Colors.white),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 706,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
              child: ListView.separated(
                itemCount: 1,
                separatorBuilder: (BuildContext context, int index) => height16,
                itemBuilder: (BuildContext context, int index) {
                  return const EducationCard(
                    specialization: "specialization",
                    universtyName: "universtyName",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
