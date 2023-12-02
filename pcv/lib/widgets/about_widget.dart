// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pcv/blocs/about_bloc/about_bloc.dart';
import 'package:pcv/widgets/conta_home_widget.dart';

class AboutWidget extends StatelessWidget {
  AboutWidget(
      {super.key,
      this.id,
      this.name,
      this.email,
      this.titlePosition,
      this.phone,
      this.location,
      this.birthday,
      this.about,
      this.image});
  final String? id;
  final String? name;
  final String? email;
  final String? titlePosition;
  final String? phone;
  final String? location;
  final String? birthday;
  final String? about;
  final String? image;
  final ImagePicker picker = ImagePicker();

  late File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      BlocListener<AboutBloc, AboutState>(
        listener: (context, state) {
          if (state is ErrorAboutState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg)));
          }
        },
        child: InkWell(
            onTap: () async {
              try {
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                imageFile = File(image!.path);
                context.read<AboutBloc>().add(UpdateImage(image: imageFile));

                showDialog(
                    context: context,
                    builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ));
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: ClipOval(
              child: Container(
                height: 120,
                width: 120,
                color: const Color(0xffff6700),
                child: image == null
                    ? const Center(
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : Image.network(
                        image!,
                        fit: BoxFit.cover,
                      ),
              ),
            )),
      ),
      Column(
        children: [
          Text(
            ' ${name.toString()}',
            style: const TextStyle(fontSize: 28),
          ),
          if (titlePosition != null && titlePosition != "null")
            Text(
              titlePosition.toString(),
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
        ],
      ),
      if (about != null && about != "null")
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(about.toString()),
        ),
      const SizedBox(
        height: 24,
      ),
      ContaHomeWidget(
        icon: Icons.email,
        text: email.toString(),
      ),
      ContaHomeWidget(
        icon: Icons.phone,
        text: phone.toString(),
      ),
      if (location != null)
        ContaHomeWidget(
          icon: Icons.location_on,
          text: location.toString(),
        ),
      if (birthday != null)
        ContaHomeWidget(
          icon: Icons.date_range_outlined,
          text: birthday.toString(),
        ),
    ]);
  }
}
