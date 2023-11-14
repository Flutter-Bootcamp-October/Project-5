import 'package:cv_application_api/constant/constant.dart';
import 'package:cv_application_api/model/education.dart';
import 'package:cv_application_api/pages/add_education_screen.dart';
import 'package:cv_application_api/services/api/education_api.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/normal_text.dart';
import 'package:cv_application_api/widgets/custom_widget_for_all_screens/title_of_screen.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  bool _isLoading = true;
  Education? education;
  @override
  void initState() {
    super.initState();
    getUserInfoMethode();
    Future.delayed(Duration(seconds: 6), () {
      setState(() {
        _isLoading = false;
      });
      setState(() {});
    });
    setState(() {});
  }

  Future<Education> getUserInfoMethode() async {
    final Education? response = await getUserEducation(context: context);
    print(response!);
    education = response;
    setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AddEducationScreen();
                      }));
                      setState(() {});
                    },
                    child: const TitleOfScreen(
                      title: "Add Education",
                      titleFontSize: 30,
                      titleletterSpacing: 3,
                      titleColor: appWhite,
                      titlefontWeight: FontWeight.bold,
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 1,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      if (_isLoading == true)
                        const Center(
                          child: CircularProgressIndicator(
                            color: app2DarkGreen,
                          ),
                        ),
                      if (_isLoading == false)
                        for (int i = 0;
                            i < education!.education_data!.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Container(
                              height: 500,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: app2DarkGreenTrans),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      height14,
                                      const TitleOfScreen(
                                        title: 'College :',
                                        titleFontSize: 18,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                      height4,
                                      NormalText(
                                        title: education
                                                ?.education_data![i].college! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
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
                                      NormalText(
                                        title: education
                                                ?.education_data![i].college! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
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
                                      NormalText(
                                        title: education
                                                ?.education_data![i].college! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
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
                                      NormalText(
                                        title: education
                                                ?.education_data![i].college! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
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
                                      NormalText(
                                        title: education
                                                ?.education_data![i].college! ??
                                            '',
                                        titleFontSize: 15,
                                        titleletterSpacing: 0,
                                        titlefontWeight: FontWeight.w300,
                                        titleColor: appWhite,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
