// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:cv/models/user.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: user.name);
    TextEditingController titleController =
        TextEditingController(text: user.titlePosition ?? "");
    TextEditingController phoneController =
        TextEditingController(text: user.phone);
    TextEditingController locationController =
        TextEditingController(text: user.location ?? "");
    TextEditingController birthController =
        TextEditingController(text: user.birthday ?? "");
    TextEditingController aboutController =
        TextEditingController(text: user.about ?? "");
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hight40(),
                hight14(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Edit your Information",
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
                          label: 'Name',
                          hint: 'Enter your name',
                          isPassword: false,
                          controller: nameController,
                          icon: HeroIcons.newspaper,
                        ),
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Title Position',
                        hint: 'Enter your title position',
                        isPassword: false,
                        controller: titleController,
                        icon: HeroIcons.ticket,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Phone',
                        hint: 'Enter your phone',
                        isPassword: false,
                        controller: phoneController,
                        icon: Icons.phone,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Location',
                        hint: 'Enter your location',
                        isPassword: false,
                        controller: locationController,
                        icon: Icons.location_on,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'Birthday',
                        hint: 'Enter your birthday',
                        isPassword: false,
                        controller: birthController,
                        icon: Icons.calendar_month,
                      ),
                      hight30(),
                      AddTextField(
                        label: 'About',
                        hint: 'Enter about your selfe ',
                        isPassword: false,
                        controller: aboutController,
                        icon: HeroIcons.document_plus,
                      ),
                      hight30(),
                    ]),
                Center(
                  child: BlocListener<EditProfileBloc, EditProfileState>(
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
                                  "Your information is updated successfully",
                                  style: TextStyle(color: Colors.black),
                                )));

                        Navigator.pop(context, true);
                      }
                    },
                    child: InkWell(
                      onTap: () async {
                        context.read<EditProfileBloc>().add(EditProfileEvent(
                              context,
                              nameController.text,
                              titleController.text,
                              phoneController.text,
                              locationController.text,
                              birthController.text,
                              aboutController.text,
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
                            "Update Information",
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
