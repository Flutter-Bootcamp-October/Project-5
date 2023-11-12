import 'package:cv/constants/colors.dart';
import 'package:cv/constants/sizes.dart';
import 'package:cv/widgets/education_details.dart';
import 'package:flutter/material.dart';

class AboutInfoCard extends StatelessWidget {
  const AboutInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 32, top: 32),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          height: MediaQuery.of(context).size.height - 400,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 60),
                                child: Text(
                                  "Lujain Bawazir",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height4,
                              const Text(
                                "Fresh graduate",
                                style: TextStyle(color: Colors.grey),
                              ),
                              height32,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  EducationDetail(
                                      icon: Icons.phone_android,
                                      title: "0553218334"),
                                  height16,
                                  EducationDetail(
                                      icon: Icons.location_pin,
                                      title: "Riyadh"),
                                  height16,
                                  EducationDetail(
                                      icon: Icons.date_range,
                                      title: "1998/09/12"),
                                ],
                              ),
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 43),
                                    child: Text("about me"),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ])),
          ),
        ));
  }
}
