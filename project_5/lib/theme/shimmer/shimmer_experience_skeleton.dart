import 'package:flutter/material.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timelines/timelines.dart';

class ShimmerExperienceSkeleton extends StatelessWidget {
  const ShimmerExperienceSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight() * .33,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Timeline.tileBuilder(
          shrinkWrap: false,
          theme: TimelineTheme.of(context).copyWith(
              nodePosition: .03,
              indicatorTheme: const IndicatorThemeData(
                color: Color(0xffb1a2fd),
              ),
              connectorTheme: const ConnectorThemeData(
                color: Color(0xffded3fc),
              )),
          // shrinkWrap: true,
          builder: TimelineTileBuilder.fromStyle(
            contentsAlign: ContentsAlign.basic,
            indicatorStyle: IndicatorStyle.outlined,
            itemCount: 5, //TODO: Get user's experience.length
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Shimmer.fromColors(
                baseColor: isDarkTheme ? Colors.black : Colors.white,
                highlightColor: Colors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: context.getWidth() * .2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black.withOpacity(0.04),
                      ),
                      child: const Text(''),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black.withOpacity(0.04),
                      ),
                      child: const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(''),
                        subtitle: Text(''),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
