import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/about_bloc/about_bloc.dart';
import 'package:pcv/widgets/button_widget.dart';
import 'package:pcv/widgets/text_field_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {super.key,
      required this.birthdayController,
      required this.usernameController,
      required this.titPoController,
      required this.locationController,
      required this.phoneController,
      required this.aboutController});

  final TextEditingController usernameController;
  final TextEditingController titPoController;
  final TextEditingController locationController;
  final TextEditingController phoneController;
  final TextEditingController aboutController;
  final TextEditingController birthdayController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        TextFieldWidget(
          text: 'name',
          obscure: false,
          controller: usernameController,
        ),
        TextFieldWidget(
          text: 'title Position',
          obscure: false,
          controller: titPoController,
        ),
        TextFieldWidget(
          text: 'Phone',
          obscure: false,
          controller: phoneController,
        ),
        TextFieldWidget(
          text: 'location',
          obscure: false,
          controller: locationController,
        ),
        TextFieldWidget(
          text: 'about',
          obscure: false,
          controller: aboutController,
        ),
        TextFieldWidget(
          text: 'birthday',
          obscure: false,
          keyboardType: TextInputType.datetime,
          controller: birthdayController,
        ),
        ButtonWidget(
          onPressed: () async {
            context.read<AboutBloc>().add(UpdateAbout(
                username: usernameController.text,
                titPosition: titPoController.text,
                location: locationController.text,
                phone: phoneController.text,
                about: aboutController.text,
                birthday: birthdayController.text));
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pop();
            });
          },
          text: 'Register',
        ),
      ],
    ));
  }
}
