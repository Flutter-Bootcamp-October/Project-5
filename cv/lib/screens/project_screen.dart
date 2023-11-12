import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController stateController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Project",
                style: TextStyle(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              AddTextField(
                label: 'Name',
                hint: 'Enter project name',
                isPassword: false,
                controller: nameController,
                icon: Icons.text_fields,
              ),
              hight30(),
              AddTextField(
                label: 'Description',
                hint: 'Enter project description',
                isPassword: true,
                controller: descriptionController,
                icon: Icons.description,
              ),
              hight30(),
              AddTextField(
                label: 'State',
                hint: 'Enter project state',
                isPassword: true,
                controller: stateController,
                icon: Icons.update,
              ),
              hight40(),
              hight8(),
              InkWell(
                onTap: () async {},
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: pink),
                  child: const Center(
                    child: Text(
                      "Add Project",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
