import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/skills_model.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/services/skills_api.dart';
import 'package:project_5/theme/shimmer/shimmer_card_skeleton.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key, required this.skillsData, required this.updateMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: skillsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final SkillsModel skills = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                itemCount: skills.data!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Warning"),
                                content: Wrap(
                                  children: [
                                    Text(
                                        "Are you sure you want to delete ${skills.data?[index].skill}\n"),
                                    AuthButton(
                                        content: "Submit",
                                        color: Colors.grey,
                                        onPressedFunc: () {
                                          deleteSkill(
                                              id: skills.data![index].id!);
                                          updateMethod.call();
                                          Navigator.pop(context);
                                        },
                                        isDisabled: false)
                                  ],
                                ),
                              ));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.language,
                            color: Colors.blueAccent,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "${skills.data?[index].skill}",
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return ShimmerCardSkeleton(
                numberOfItems: 8, itemWidth: context.getWidth() * .2);
          }
        });
  }

  final Future? skillsData;
  final Function updateMethod;
}
