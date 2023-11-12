import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfileHeaderSkeleton extends StatelessWidget {
  const ShimmerProfileHeaderSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDarkTheme ? Colors.black : Colors.white,
      highlightColor: Colors.grey,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black.withOpacity(0.04),
            foregroundColor: Colors.black.withOpacity(0.04),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: context.getWidth() * .2,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text("")),
                    const SizedBox(height: 5),
                    Container(
                        width: context.getWidth() * .8,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text("")),
                    const SizedBox(height: 5),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
