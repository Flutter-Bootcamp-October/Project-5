import 'package:cv_app/globals/colors.dart';
import 'package:cv_app/services/project.dart';
import 'package:cv_app/widgets/app_botton.dart';
import 'package:cv_app/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

int selectedValue = 1;
List opt = ["completed", "processing", "other"];

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(),
        descriptionController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: const Text("Add Projects"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AppTextField(
                label: "Name",
                icon: Icons.dynamic_feed_rounded,
                controller: nameController),
            AppTextField(
                label: "description",
                icon: Icons.notes_rounded,
                controller: descriptionController),
            DropdownMenu(
                onSelected: (value) {
                  selectedValue = value!;
                },
                width: MediaQuery.of(context).size.width / 1.3,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1, label: "Completed"),
                  DropdownMenuEntry(value: 2, label: "Processing"),
                  DropdownMenuEntry(value: 3, label: "other"),
                ]),
            const SizedBox(height: 20),
            AppBotton(
              text: "Add",
              onTap: () async {
                final response = await addProject(
                    name: nameController.text,
                    description: descriptionController.text,
                    state: opt[selectedValue - 1]);
                if (response['codeState'] == 200) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(response['msg'].toString())),
                  );
                }
              },
            )
          ],
        ));
  }
}
