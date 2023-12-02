// ignore_for_file: use_build_context_synchronously

import 'package:cv/blocs/radio_button_bloc/radio_button_bloc.dart';
import 'package:cv/blocs/social_bloc/social_bloc.dart';
import 'package:cv/style/colors.dart';
import 'package:cv/style/sizes.dart';
import 'package:cv/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:icons_plus/icons_plus.dart';

class SocilaScreen extends StatelessWidget {
  const SocilaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController socialController = TextEditingController();

    String type = "telegram";
    final status = [
      "telegram",
      "facebook",
      "youtube",
      "whatsapp",
      "instagram",
      "twitter",
      "tiktok"
    ];
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add New Social Media",
                    style: TextStyle(
                        fontSize: 25, color: blue, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: AddTextField(
                      label: 'Username',
                      hint: 'Enter Username',
                      isPassword: false,
                      controller: socialController,
                      icon: HeroIcons.device_phone_mobile,
                    ),
                  ),
                ],
              ),
              hight16(),
              Padding(
                padding: const EdgeInsets.only(left: 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hight8(),
                    Text(
                      "Choose social media type:",
                      style: TextStyle(fontSize: 16, color: blue),
                    ),
                    hight8(),
                    BlocBuilder<RadioButtonBloc, RadioButtonState>(
                      builder: (context, state) {
                        if (state is Radiostate) {
                          RadioGroup<String>.builder(
                            groupValue: type,
                            onChanged: (value) {
                              context
                                  .read<RadioButtonBloc>()
                                  .add(RadioButtonEvent(value!));
                              type = state.value;
                            },
                            items: status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                            fillColor: lightOrange,
                          );
                        }
                        return RadioGroup<String>.builder(
                          groupValue: type,
                          onChanged: (value) {
                            context
                                .read<RadioButtonBloc>()
                                .add(RadioButtonEvent(value!));
                            type = value;
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
                child: BlocListener<SocialBloc, SocialState>(
                  listener: (context, state) {
                    if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            state.massege,
                            style: const TextStyle(color: Colors.black),
                          )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            "Social is added successfully",
                            style: TextStyle(color: Colors.black),
                          )));
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      context.read<SocialBloc>().add(SocialEvent(
                            context,
                            socialController.text,
                            type,
                          ));
                    },
                    child: Container(
                      width: 330,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), color: pink),
                      child: const Center(
                        child: Text(
                          "Add Social",
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
    );
  }
}
