import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/services/social_api.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Social extends StatelessWidget {
  const Social({Key? key, required this.updateMethod, this.socialData})
      : super(key: key);

  final Function updateMethod;
  final Future? socialData;
  @override
  Widget build(BuildContext context) {
    List imgs = [];
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: FutureBuilder(
        future: socialData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final SocialModel socialModel = snapshot.data;
            Map? isFound;
            socialMediaICons.where((element) {
              for (int i = 0; i < socialModel.data!.length; i++) {
                if (element.containsKey(socialModel.data![i].social)) {
                  isFound = {socialModel.data![i].social: element.values};
                  imgs.add(element.values);
                  print(isFound);
                }
              }
              return true;
            }).toList();
            return Wrap(
              children: [
                ...List.generate(
                    socialModel.data!.length,
                    (index) => InkWell(
                          onTap: () {
                            showAdaptiveDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Warning"),
                                      content: Wrap(
                                        children: [
                                          Text(
                                              "Are you sure you want to delete ${socialModel.data?[index].username} on ${socialModel.data?[index].social}\n"),
                                          AuthButton(
                                              content: "Submit",
                                              color: Colors.grey,
                                              onPressedFunc: () {
                                                deleteSocial(
                                                    socialId: socialModel
                                                        .data![index].id!);
                                                updateMethod.call();
                                                Navigator.pop(context);
                                              },
                                              isDisabled: false)
                                        ],
                                      ),
                                    ));
                          },
                          child: Wrap(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                      scale: 25,
                                      imgs[index].toString().substring(1,
                                          imgs[index].toString().length - 1)),
                                  Text("${socialModel.data![index].username}"),
                                ],
                              )
                              //*${socialModel.data![index].social}*//
                            ],
                          ),
                        ))
              ],
            );
          } else {
            return ShimmerTextSkeleton(
              numberOfItems: 3,
              itemWidth: context.getWidth() * .85 / 3.8,
            );
          }
        },
      ),
    );
  }
}
