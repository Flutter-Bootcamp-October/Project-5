import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/theme/shimmer/shimmer_experience_skeleton.dart';
import 'package:timelines/timelines.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key, this.educationData}) : super(key: key);

  final Future? educationData;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: educationData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final EducationModel educationModel = snapshot.data;
            return SizedBox(
              height: educationModel.data!.length > 0
                  ? context.getHeight() * .25
                  : context.getHeight() * .01,
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
                    itemCount: educationModel.data!.length,
                    contentsBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${educationModel.data![index].specialization}',
                            textAlign: TextAlign.start,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                                '${educationModel.data![index].university}'),
                            subtitle: const Text('Description'),
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
