import 'package:flutter/material.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/projects_model.dart';
import 'package:project_5/services/projects_api.dart';
import 'package:project_5/theme/shimmer/shimmer_experience_skeleton.dart';
import 'package:timelines/timelines.dart';

class Projects extends StatelessWidget {
  const Projects(
      {Key? key, required this.projectsData, required this.updateProjects})
      : super(key: key);

  final Future? projectsData;
  final Function? updateProjects;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: projectsData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final ProjectsModel projectsData = snapshot.data;
            return projectsData.data!.length > 0
                ? SizedBox(
                    height: context.getHeight() * .25,
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
                          itemCount: projectsData.data!.length,
                          contentsBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) async {
                                deleteProject(
                                    projectId: snapshot.data.data?[index].id);

                                await updateProjects?.call();
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Project ${projectsData.data![index].name}',
                                    textAlign: TextAlign.start,
                                  ),
                                  Flexible(
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                          'Description: ${projectsData.data![index].description}'),
                                      subtitle: Text(
                                          '${projectsData.data![index].state}'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 8),
                    child: Text("-You have no projects yet-"),
                  );
          } else {
            return const ShimmerExperienceSkeleton();
          }
        });
  }
}
