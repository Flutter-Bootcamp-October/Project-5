import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/education_bloc/education_bloc.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

Future<void> addEducation(BuildContext context) {
  const List<String> level = <String>[
    'school',
    'diploma',
    'Bachelors',
    'Master',
    'Ph.D',
    'other'
  ];
  String dropdownValue = level.first;
  TextEditingController dateGraduationController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: const Text('Add Skill'),
          content: BlocBuilder<EducationBloc, EducationState>(
            builder: (context, state) {
              if (state is ChangeStateEducaion) {
                return Column(
                  children: [
                    TextFieldWidget(
                        text: 'Graduation date',
                        obscure: false,
                        controller: dateGraduationController),
                    TextFieldWidget(
                        text: 'university',
                        obscure: false,
                        controller: universityController),
                    TextFieldWidget(
                        text: 'college',
                        obscure: false,
                        controller: collegeController),
                    TextFieldWidget(
                        text: 'mejor',
                        obscure: false,
                        controller: specializationController),
                    DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width * 0.6,
                      inputDecorationTheme: const InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(25),
                                  right: Radius.circular(25)))),
                      initialSelection: level.first,
                      onSelected: (String? value) {
                        context
                            .read<EducationBloc>()
                            .add(ChangeEvent(state: value!));
                        dropdownValue = state.state;
                      },
                      dropdownMenuEntries:
                          level.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry(value: value, label: value);
                      }).toList(),
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        context.read<EducationBloc>().add(AddEducationEvent(
                            graduationDate: dateGraduationController.text,
                            university: universityController.text,
                            college: collegeController.text,
                            specialization: specializationController.text,
                            level: dropdownValue));

                        Navigator.of(context).pop();
                      },
                      text: 'Add',
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  TextFieldWidget(
                      text: 'Graduation date',
                      obscure: false,
                      controller: dateGraduationController),
                  TextFieldWidget(
                      text: 'university',
                      obscure: false,
                      controller: universityController),
                  TextFieldWidget(
                      text: 'college',
                      obscure: false,
                      controller: collegeController),
                  TextFieldWidget(
                      text: 'mejor',
                      obscure: false,
                      controller: specializationController),
                  DropdownMenu<String>(
                    width: MediaQuery.of(context).size.width * 0.6,
                    inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25)))),
                    initialSelection: level.first,
                    onSelected: (String? value) {
                      context
                          .read<EducationBloc>()
                          .add(ChangeEvent(state: value!));
                      dropdownValue = value;
                    },
                    dropdownMenuEntries:
                        level.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  ),
                  ButtonWidget(
                    onPressed: () async {
                      context.read<EducationBloc>().add(AddEducationEvent(
                          graduationDate: dateGraduationController.text,
                          university: universityController.text,
                          college: collegeController.text,
                          specialization: specializationController.text,
                          level: dropdownValue));

                      Navigator.of(context).pop();
                    },
                    text: 'Add',
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
