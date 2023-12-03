import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardSkeleton extends StatelessWidget {
  const ShimmerCardSkeleton({
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
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GridView.builder(
                itemCount: numberOfItems,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.04),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          null,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "",
                        ),
                      ],
                    ),
                  );
                })));
  }
}
