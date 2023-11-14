import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListAllUsers extends StatelessWidget {
  const ShimmerListAllUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDarkTheme ? Colors.black : Colors.white,
      highlightColor: Colors.grey,
      child: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) => Card(
          color: Colors.black.withOpacity(0.04),
          child: const ListTile(),
        ),
      ),
    );
  }
}
