import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/theme/shimmer/shimmer_text_skeleton.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: FutureBuilder(
            future: null,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BACHELOR’S DEGREE IN SOFTWARE ENGINEERING",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "2018 - 2023",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text("King Fahd University of Petroleum and Minerals",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300)),
                  ],
                );
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
