import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/modules/community_module.dart';
import 'package:cv/services/education_api.dart';
import 'package:cv/widgets/add_new_button.dart';
import 'package:cv/widgets/bottom_sheet_text_filed.dart';
import 'package:cv/widgets/button.dart';
import 'package:cv/widgets/education_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EducationScreen extends StatefulWidget {
  EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  TextEditingController specializationController = TextEditingController(),
      universtyController = TextEditingController(),
      collegeController = TextEditingController(),
      levelController = TextEditingController(),
      graduationDateController = TextEditingController();

  Education? education;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadEducation();
  }

  loadEducation() async {
    education = await getAllEducationData();
    print(education?.university);
    setState(() {});
  }

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
                                            onpressed: () async {
                                              Response result =
                                                  await sendEducationData(
                                                      graduationDateController
                                                          .text,
                                                      universtyController.text,
                                                      collegeController.text,
                                                      specializationController
                                                          .text,
                                                      levelController.text);
                                              if (result.statusCode == 200) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            ("new education has been added successfully"))));
                                              }
                                            },
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
              child: FutureBuilder(
                  future: getAllEducationData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ListView.separated(
                        itemCount: 1,
                        separatorBuilder: (BuildContext context, int index) =>
                            height16,
                        itemBuilder: (BuildContext context, int index) {
                          return EducationCard(
                            specialization: education!.specialization ??
                                "No specialization",
                            universtyName:
                                education!.university ?? "No university",
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("error"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
