import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/skills_bloc/skills_cubit.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/skills_model.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/services/skills_api.dart';
import 'package:project_5/theme/shimmer/shimmer_card_skeleton.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key, this.state}) : super(key: key);

  final dynamic state;
  @override
  Widget build(BuildContext context) {
    state is SkillsInitial ? context.read<SkillsCubit>().getSkillsCubit() : const SizedBox();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: state is SkillsGetDataState
            ? state.skillsModel.data!.isNotEmpty
                ? GridView.builder(
                    itemCount: state.skillsModel.data!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8.0,
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
                                            "Are you sure you want to delete ${state.skillsModel.data?[index].skill}\n"),
                                        AuthButton(
                                          content: "Submit",
                                          color: Colors.grey,
                                          isDisabled: false,
                                          onPressedFunc: () {
                                            context.read<SkillsCubit>().deleteSkillsCubit(
                                                id: state.skillsModel.data![index].id!);

                                            Navigator.pop(context);
                                          },
                                        )
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
                                "${state.skillsModel.data?[index].skill}",
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Text("There are no Skills Added")
            : state is SkillsInitial
                ? ShimmerCardSkeleton(numberOfItems: 8, itemWidth: context.getWidth() * .2)
                : const SizedBox());
  }
}
