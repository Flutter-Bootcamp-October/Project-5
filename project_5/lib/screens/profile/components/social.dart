import 'package:flutter/material.dart';
import 'package:flex_list/flex_list.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Social extends StatelessWidget {
  const Social({Key? key, required this.updateMethod, this.socialData})
      : super(key: key);

  final Function updateMethod;
  final Future? socialData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: FutureBuilder(
        future: socialData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final SocialModel socialModel = snapshot.data;
            return Row(
              children: [
                ...List.generate(
                    socialModel.data!.length,
                    (index) => SizedBox(
                        width: 300,
                        child: FlexList(
                          horizontalSpacing: 4,
                          verticalSpacing: 5,
                          children: [
                            Text("${socialModel.data![index].social}"),
                          ],
                        )))
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
