import 'package:flutter/material.dart';
import 'package:project_5/views/education/education_veiw.dart';
import 'package:project_5/widgets/custom_button.dart';
import 'package:project_5/widgets/custom_tex_field.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController idNameController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController birthdayController = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xfff3f3f3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'About',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Name',
                hint: 'UserName',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: userNameController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Title',
                hint: 'Position',
                icon: Icons.title_outlined,
                isPassword: false,
                controller: titleController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Phone',
                hint: 'Your Phone',
                icon: Icons.phone_android_outlined,
                isPassword: false,
                controller: phoneController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Location',
                hint: 'Your Location',
                icon: Icons.location_pin,
                isPassword: false,
                controller: locationController),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
                lable: 'Birthday',
                hint: 'Your Birthday',
                icon: Icons.person_2_outlined,
                isPassword: false,
                controller: birthdayController),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Next'),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditEducationView()));
                      },
                      icon: Icon(Icons.arrow_right_alt_outlined))
                ],
              )),
        ],
      ),
    );
  }
}
