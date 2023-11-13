import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/services/education_api.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
    this.educationData,
    required this.updateMethod,
  });
  final Future? educationData;
  final Function updateMethod;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: FutureBuilder(
            future: educationData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final EducationModel educationModel = snapshot.data;
                return educationModel.data!.isNotEmpty
                    ? SizedBox(
                        height: educationModel.data!.length > 0
                            ? context.getHeight() * .25
                            : context.getHeight() * .1,
                        child: ListView.separated(
                            // shrinkWrap: true,
                            itemCount: educationModel.data!.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (context, index) => Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) async {
                                    deleteEducation(
                                        educationId:
                                            educationModel.data?[index].id);

                                    await updateMethod.call();
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
                                  child: InkWell(
                                    onLongPress: () {
                                      //TODO:Make it show edit icon
                                    },
                                    child: SizedBox(
                                      width: context.getWidth(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${educationModel.data?[index].level!.toUpperCase()} DEGREE IN ${educationModel.data![index].specialization?.toUpperCase()}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "Graduated ${educationModel.data?[index].graduationDate!.toUpperCase()}",
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                              "${educationModel.data?[index].university}",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300)),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      )
                    : const Text("No Education has been Added");
              } else {
                return Column(
                  children: [
                    ShimmerTextSkeleton(
                        numberOfItems: 1, itemWidth: context.getWidth() * .9),
                    const SizedBox(height: 5),
                    ShimmerTextSkeleton(
                        numberOfItems: 1, itemWidth: context.getWidth() * .4),
                    const SizedBox(height: 5),
                    ShimmerTextSkeleton(
                        numberOfItems: 1, itemWidth: context.getWidth() * .9),
                  ],
                );
              }
            }));
  }
}
