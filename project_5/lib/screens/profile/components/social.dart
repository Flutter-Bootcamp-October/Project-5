import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/reusable_widgets/social_modal_sheet.dart';
import 'package:project_5/services/social_api.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Social extends StatefulWidget {
  const Social({Key? key, required this.updateMethod, this.socialData})
      : super(key: key);

  final Function updateMethod;
  final Future? socialData;

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  List<Map> iconsList = const [
    {
      "snapchat": Icon(Icons.snapchat),
    },
    {
      "telegram": Icon(Icons.telegram),
    },
    {
      "facebook": Icon(Icons.facebook),
    },
    {
      "tiktok": Icon(Icons.tiktok),
    },
    {
      "other": Icon(Icons.question_mark),
    },
    {
      "youtube": Icon(Icons.play_arrow),
    },
    {
      "instagram": Icon(Icons.camera),
    },
    {
      "twitter": Icon(Icons.flutter_dash_outlined),
    },
    {
      "whatsapp": Icon(Icons.call),
    },
  ];

  List imgs = [];
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: widget.socialData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final SocialModel socialModel = snapshot.data;
                updateIconsList(socialModel, iconsList, imgs);
                return socialModel.data!.length != 0
                    ? Flexible(
                        child: Wrap(
                          children: [
                            ...List.generate(
                                socialModel.data!.length,
                                (index) => InkWell(
                                      onTap: () {
                                        socialDialog(context, socialModel,
                                            index, iconsList, imgs);
                                        setState(() {});
                                      },
                                      child: Wrap(
                                        children: [
                                          imgs[index],
                                          Text(
                                              " ${socialModel.data![index].username} "),
                                        ],
                                      ),
                                    )),
                          ],
                        ),
                      )
                    : const Text("No Social Media Added yet");
              } else {
                return ShimmerTextSkeleton(
                  numberOfItems: 3,
                  itemWidth: context.getWidth() * .85 / 3.8,
                );
              }
            },
          ),
          IconButton(
              onPressed: () {
                socialModalBottomSheet(
                  context,
                  content: "Social Media",
                  isSkills: true,
                  userNameController: userNameController,
                  updateMethod: widget.updateMethod,
                );
              },
              icon: const Icon(Icons.edit_outlined)),
        ],
      ),
    );
  }

  void socialDialog(BuildContext context, SocialModel socialModel, int index,
      List<Map<dynamic, dynamic>> iconsList, List<dynamic> imgs) {
    showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Warning"),
            content: Wrap(
              children: [
                Text(
                    "Are you sure you want to delete ${socialModel.data?[index].username} on ${socialModel.data?[index].social}\n"),
                AuthButton(
                    content: "Submit",
                    color: Colors.grey,
                    onPressedFunc: () async {
                      for (var item in iconsList) {
                        if (socialModel.data![index].social != null &&
                            item[socialModel.data![index].social] != null) {
                          imgs.remove(item[socialModel.data![index].social]);
                        }
                      }
                      await deleteSocial(socialId: socialModel.data![index].id!)
                          .then((value) {
                        widget.updateMethod.call();
                        Navigator.pop(context);
                      });
                    },
                    isDisabled: false)
              ],
            ),
          );
        });
  }

  void updateIconsList(SocialModel socialModel,
      List<Map<dynamic, dynamic>> iconsList, List<dynamic> imgs) {
    socialModel.data?.where((element) {
      for (var item in iconsList) {
        if (item[element.social] != null &&
            !imgs.contains(item[element.social])) {
          imgs.add(item[element.social]);
        }
      }

      return true;
    }).toList();
  }
}
