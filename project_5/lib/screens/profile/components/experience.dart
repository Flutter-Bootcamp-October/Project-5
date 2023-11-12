import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/theme/shimmer/shimmer_experience_skeleton.dart';
import 'package:timelines/timelines.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                    itemCount: 10, //TODO: Get user's experience.length
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Experience $index',
                            textAlign: TextAlign.start,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('work $index'),
                            subtitle: Text('Description $index'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const ShimmerExperienceSkeleton();
          }
        });
  }
}
