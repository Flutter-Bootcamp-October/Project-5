import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/project_bloc/project_bloc.dart';
import 'package:pcv/widgets/text_field_widget.dart';
import '../../../globel/global.dart';
import '../../../widgets/button_widget.dart';

Future<void> addProject(BuildContext context) {
  String dropdownValue = list.first;
  final usernameController = TextEditingController();
  final descripController = TextEditingController();
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return BlocListener<ProjectBloc, ProjectState>(
        listener: (context, state) {
          if (state is ErrorProjectState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        child: AlertDialog(
          title: const Text('Add Project'),
          content: BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              if (state is ChangeState) {
                return Column(
                  children: [
                    TextFieldWidget(
                      text: 'name',
                      obscure: false,
                      controller: usernameController,
                    ),
                    TextFieldWidget(
                      text: 'Description',
                      obscure: false,
                      controller: descripController,
                    ),
                    DropdownMenu<String>(
                      width: 250,
                      inputDecorationTheme: const InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(25),
                                  right: Radius.circular(25)))),
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        context
                            .read<ProjectBloc>()
                            .add(ChangeStateProjectEvent(state: value!));
                        dropdownValue = state.state;
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry(value: value, label: value);
                      }).toList(),
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        context.read<ProjectBloc>().add(AddProjectEvent(
                            name: usernameController.text,
                            description: descripController.text,
                            state: dropdownValue));
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
                    text: 'name',
                    obscure: false,
                    controller: usernameController,
                  ),
                  TextFieldWidget(
                    text: 'Description',
                    obscure: false,
                    controller: descripController,
                  ),
                  DropdownMenu<String>(
                    width: 250,
                    inputDecorationTheme: const InputDecorationTheme(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(25),
                                right: Radius.circular(25)))),
                    initialSelection: list.first,
                    onSelected: (String? value) {
                      context
                          .read<ProjectBloc>()
                          .add(ChangeStateProjectEvent(state: value!));
                      dropdownValue = value;
                    },
                    dropdownMenuEntries:
                        list.map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  ),
                  ButtonWidget(
                    onPressed: () async {
                      context.read<ProjectBloc>().add(AddProjectEvent(
                          name: usernameController.text,
                          description: descripController.text,
                          state: dropdownValue));
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
