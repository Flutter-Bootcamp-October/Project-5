import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextSkeleton extends StatelessWidget {
  const ShimmerTextSkeleton({
    super.key,
    required this.numberOfItems,
    required this.itemWidth,
  });

  final int numberOfItems;
  final double itemWidth;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDarkTheme ? Colors.black : Colors.white,
      highlightColor: Colors.grey,
      child: Row(
        children: [
          ...List.generate(
              numberOfItems,
              (index) => Row(
                    children: [
                      Container(
                        width: itemWidth,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(4)),
                        child: FlexList(
                          horizontalSpacing: 4,
                          children: const [
                            Text(""),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ))
        ],
      ),
    );
  }
}
