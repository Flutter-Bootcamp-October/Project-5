import 'package:cv_app/constentes/colors.dart';
import 'package:cv_app/constentes/sized_box.dart';
import 'package:cv_app/models/globals.dart';
import 'package:cv_app/models/social_media/social_media_data_model.dart';
import 'package:cv_app/widgets/information_widget/button_widget.dart';
import 'package:cv_app/widgets/information_widget/textfiled_widget.dart';
import 'package:flutter/material.dart';

class AddSocialMediasWidget extends StatefulWidget {
  const AddSocialMediasWidget({super.key});

  @override
  _AddSocialMediasWidgetState createState() => _AddSocialMediasWidgetState();
}

class _AddSocialMediasWidgetState extends State<AddSocialMediasWidget> {
  TextEditingController socialMediaController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  List<SocialMediaData> socialMediasList = [];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: lightGrey,
      collapsedBackgroundColor: lightGrey,
      iconColor: prussianBlue,
      collapsedIconColor: prussianBlue,
      title: const Text(
        'SocialMedias',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: prussianBlue,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: socialMediasList.length,
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      SocialMediaData socialMedia = socialMediasList[index];

                      return Column(
                        children: [
                          TextFelidWidget(
                            hintTitle: 'Enter name social media',
                            title: 'Name social media',
                            controller: socialMediaController,
                            onChanged: (value) {
                              socialMediasList[index].social = value;
                              socialMediaController.text = value;
                            },
                          ),
                          TextFelidWidget(
                            hintTitle: 'Enter your username',
                            title: 'Username',
                            controller: userNameController,
                            onChanged: (value) {
                              socialMediasList[index].username = value;
                              userNameController.text = value;
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  height10,
                  if (socialMediasList.isNotEmpty)
                    ButtonWidget(
                      onTap: () async {
                        final result =
                            await network.addSocialMediaMethod(body: {
                          "social": socialMediaController.text,
                          "username": userNameController.text,
                        });
                      },
                      name: 'Send social media',
                    ),
                  if (socialMediasList.isEmpty)
                    ButtonWidget(
                      onTap: () {
                        setState(() {
                          socialMediasList
                              .add(SocialMediaData(username: '', social: ''));
                        });
                      },
                      name: 'Add social media',
                    )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
