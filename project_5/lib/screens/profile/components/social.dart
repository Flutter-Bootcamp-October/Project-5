import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/social_bloc/social_cubit.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/screens/auth/components/auth_button.dart';
import 'package:project_5/screens/reusable_widgets/social_modal_sheet.dart';
import 'package:project_5/services/social_api.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Social extends StatelessWidget {
  Social({Key? key, required this.state}) : super(key: key);

  final dynamic state;

  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    state is SocialInitial ? context.read<SocialCubit>().getSocialCubit() : const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: state is SocialGetDataState
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                state.socialModel.data!.isNotEmpty
                    ? Flexible(
                        child: Wrap(
                          children: [
                            ...List.generate(
                                state.socialModel.data!.length,
                                (index) => InkWell(
                                      onTap: () {
                                        socialDialog(
                                            context, state.socialModel, index, iconsList, imgs);
                                      },
                                      child: Wrap(
                                        children: [
                                          imgs[index],
                                          Text(" ${state.socialModel.data![index].username} "),
                                        ],
                                      ),
                                    )),
                          ],
                        ),
                      )
                    : const Text("No Social Media Added yet"),
                IconButton(
                    onPressed: () {
                      socialModalBottomSheet(
                        context,
                        content: "Social Media",
                        isSkills: true,
                        userNameController: userNameController,
                        state: state,
                      );
                    },
                    icon: const Icon(Icons.edit_outlined)),
              ],
            )
          : state is SocialInitial
              ? ShimmerTextSkeleton(
                  numberOfItems: 3,
                  itemWidth: context.getWidth() * .85 / 3.8,
                )
              : const SizedBox(),
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
                      context
                          .read<SocialCubit>()
                          .deleteSocialCubit(id: socialModel.data![index].id!)
                          .then((value) {
                        Navigator.pop(context);
                      });
                    },
                    isDisabled: false)
              ],
            ),
          );
        });
  }
}

void updateIconsList(
    SocialModel socialModel, List<Map<dynamic, dynamic>> iconsList, List<dynamic> imgs) {
  socialModel.data?.where((element) {
    for (var item in iconsList) {
      if (item[element.social] != null && !imgs.contains(item[element.social])) {
        imgs.add(item[element.social]);
      }
    }

    return true;
  }).toList();
}
