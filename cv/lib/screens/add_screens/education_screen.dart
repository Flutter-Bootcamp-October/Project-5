// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/education_bloc/education_bloc.dart';
import 'package:cv/blocs/radio_button_bloc/radio_button_bloc.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:icons_plus/icons_plus.dart';

class EducationsScreen extends StatelessWidget {
  const EducationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String level = "school";
    final status = [
      "school",
      "diploma",
      "Bachelors",
      "Master",
      "Ph.D",
      "Other"
    ];
    TextEditingController graduationDateController = TextEditingController();
    TextEditingController universityController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
    TextEditingController specializationController = TextEditingController();

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Add New Education",
                        style: TextStyle(
                            fontSize: 25,
                            color: blue,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: AddTextField(
                          label: 'University',
                          hint: 'Enter your university',
                          isPassword: false,
                          controller: universityController,
                          icon: HeroIcons.building_library,
                        ),
                      ),
                      hight30(),
                      AddTextField(
                        label: 'College',
                        hint: 'Enter your college',
                        isPassword: false,
                        controller: collegeController,
                        icon: HeroIcons.academic_cap,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Specialization',
                        hint: 'Enter your specialization',
                        isPassword: false,
                        controller: specializationController,
                        icon: Icons.settings,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Graduation Date',
                        hint: 'Enter graduation date',
                        isPassword: false,
                        controller: graduationDateController,
                        icon: Icons.calendar_month_sharp,
                      ),
                      hight30(),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Choose eduaction level:",
                    style: TextStyle(fontSize: 16, color: blue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Column(
                    children: <Widget>[
                      BlocBuilder<RadioButtonBloc, RadioButtonState>(
                        builder: (context, state) {
                          if (state is Radiostate) {
                            RadioGroup<String>.builder(
                              groupValue: level,
                              onChanged: (value) {
                                context
                                    .read<RadioButtonBloc>()
                                    .add(RadioButtonEvent(value!));
                                level = state.value;
                              },
                              items: status,
                              itemBuilder: (item) => RadioButtonBuilder(
                                item,
                              ),
                              fillColor: lightOrange,
                            );
                          }
                          return RadioGroup<String>.builder(
                            groupValue: level,
                            onChanged: (value) {
                              context
                                  .read<RadioButtonBloc>()
                                  .add(RadioButtonEvent(value!));
                              level = value;
                            },
                            items: status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            fillColor: lightOrange,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                hight20(),
                Center(
                  child: BlocListener<EducationBloc, EducationState>(
                    listener: (context, state) {
                      if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.white,
                            content: Text(
                              state.massege,
                              style: const TextStyle(color: Colors.black),
                            )));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.white,
                                content: Text(
                                  "Education is added successfully",
                                  style: TextStyle(color: Colors.black),
                                )));
                      }
                    },
                    child: InkWell(
                      onTap: () async {
                        context.read<EducationBloc>().add(EducationEvent(
                              graduationDateController.text,
                              universityController.text,
                              collegeController.text,
                              level,
                              specializationController.text,
                              context,
                            ));
                      },
                      child: Container(
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: pink),
                        child: const Center(
                          child: Text(
                            "Add Education",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
