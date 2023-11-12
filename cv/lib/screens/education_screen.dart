import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EducationsScreen extends StatelessWidget {
  const EducationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController graduationDateController = TextEditingController();
    TextEditingController universityController = TextEditingController();
    TextEditingController collegeController = TextEditingController();
    TextEditingController specializationController = TextEditingController();
    TextEditingController levelController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Add New Education",
                style: TextStyle(
                    fontSize: 25, color: blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              AddTextField(
                label: 'University',
                hint: 'Enter your university',
                isPassword: false,
                controller: universityController,
                icon: Icons.house_outlined,
              ),
              hight30(),
              AddTextField(
                label: 'College',
                hint: 'Enter your college',
                isPassword: true,
                controller: collegeController,
                icon: Icons.verified_user_rounded,
              ),
              hight30(),
              AddTextField(
                label: 'Specialization',
                hint: 'Enter your specialization',
                isPassword: true,
                controller: specializationController,
                icon: Icons.settings,
              ),
              hight30(),
              AddTextField(
                label: 'Level',
                hint: 'Enter your level',
                isPassword: true,
                controller: levelController,
                icon: Icons.grade,
              ),
              hight30(),
              AddTextField(
                label: 'Graduation Date',
                hint: 'Enter graduation date',
                isPassword: true,
                controller: graduationDateController,
                icon: Icons.calendar_month_sharp,
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
                      "Add Education",
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
