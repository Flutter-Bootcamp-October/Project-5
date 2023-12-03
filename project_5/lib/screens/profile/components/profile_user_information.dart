import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/about_bloc/about_cubit.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/screens/settings/components/custom_bottom_modal_sheet.dart';
import 'package:project_5/theme/shimmer/shimmer_profile_header_skeleton.dart';

class ProfileUserInformation extends StatelessWidget {
  ProfileUserInformation({
    super.key,
    required this.state,
  });
  final dynamic state;

  final TextEditingController bioController = TextEditingController();

  final TextEditingController positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    state is AboutInitial
        ? context.read<AboutCubit>().getAboutDataCubit()
        : const SizedBox();
    return SizedBox(
      child: state is AboutGetDataState
          ? Column(
              children: [
                Center(
                  child: InkWell(
                      onTap: () async {
                        context.read<AboutCubit>().aboutRefreshCubit();
                      },
                      onLongPress: () async {
                        context.read<AboutCubit>().changeImageCubit();
                      },
                      child: state is! AboutGetDataState
                          ? const CircleAvatar(
                              radius: 50,
                              child: CircularProgressIndicator(),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  state.aboutModel.data.image ??
                                      placeHolderImage),
                            )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${state.aboutModel.data?.name}  ${state.aboutModel.data?.titlePosition ?? ""}",
                            style: const TextStyle(fontSize: 24),
                          ),
                          InkWell(
                            onTap: () {
                              customModalBottomSheet(
                                context,
                                controller: bioController,
                                isSkills: true,
                                content: "Bio",
                                onPressedFunc: () {
                                  context.read<AboutCubit>().changeBioCubit(
                                      name: state.aboutModel.data!.name!,
                                      position: positionController.text,
                                      phone: state.aboutModel.data!.phone!,
                                      location:
                                          "${state.aboutModel.data?.location}",
                                      birthday:
                                          "${state.aboutModel.data?.birthday}",
                                      bio: bioController.text);
                                },
                              );
                            },
                            child: state.aboutModel.data?.about != ""
                                ? Text(
                                    state.aboutModel.data?.about ??
                                        "-You have no bio yet-",
                                    style: const TextStyle(fontSize: 18),
                                  )
                                : const Text("-You have no bio yet-",
                                    style: TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const ShimmerProfileHeaderSkeleton(),
    );
  }
}

void customSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
