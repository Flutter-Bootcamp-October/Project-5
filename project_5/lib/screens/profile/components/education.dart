import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/education%20bloc/education_cubit.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/screens/reusable_widgets/confirm_dismiss_dialog.dart';

import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Education extends StatelessWidget {
  const Education({super.key, required this.state});
  final dynamic state;
  @override
  Widget build(BuildContext context) {
    state is EducationInitial ? context.read<EducationCubit>().getEducation() : const SizedBox();
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: state is EducationGetDataState
            ? state.educationModel.data!.isNotEmpty
                ? SizedBox(
                    height: state.educationModel.data!.isNotEmpty
                        ? state.educationModel.data!.length == 1
                            ? context.getHeight() * .17
                            : context.getHeight() * .25
                        : context.getHeight() * .1,
                    child: ListView.separated(
                        // shrinkWrap: true,
                        itemCount: state.educationModel.data!.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => Dismissible(
                              key: UniqueKey(),
                              confirmDismiss: (direction) {
                                return confirmDismissDialog(
                                    context, index, state.educationModel.data?[index].university);
                              },
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) async {
                                context
                                    .read<EducationCubit>()
                                    .deleteEducationCubit(id: state.educationModel.data?[index].id);
                              },
                              background: Container(
                                padding: const EdgeInsets.only(right: 16),
                                alignment: Alignment.centerRight,
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              child: SizedBox(
                                width: context.getWidth(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${state.educationModel.data?[index].level!.toUpperCase()} DEGREE IN ${state.educationModel.data![index].specialization?.toUpperCase()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                    Text(
                                      "Graduated ${state.educationModel.data?[index].graduationDate!.toUpperCase()}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text("${state.educationModel.data?[index].university}",
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.w300)),
                                  ],
                                ),
                              ),
                            )),
                  )
                : const Text("No Education has been Added")
            : state is EducationInitial
                ? Column(
                    children: [
                      ShimmerTextSkeleton(numberOfItems: 1, itemWidth: context.getWidth() * .9),
                      const SizedBox(height: 5),
                      ShimmerTextSkeleton(numberOfItems: 1, itemWidth: context.getWidth() * .4),
                      const SizedBox(height: 5),
                      ShimmerTextSkeleton(numberOfItems: 1, itemWidth: context.getWidth() * .9),
                    ],
                  )
                : const SizedBox());
  }
}
