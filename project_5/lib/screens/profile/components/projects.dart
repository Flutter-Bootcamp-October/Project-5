import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/bloc/projects_bloc/projects_cubit.dart';
import 'package:project_5/extensions/size_extension.dart';
import 'package:project_5/models/projects_model.dart';
import 'package:project_5/screens/reusable_widgets/confirm_dismiss_dialog.dart';
import 'package:project_5/services/projects_api.dart';
import 'package:project_5/theme/shimmer/shimmer_experience_skeleton.dart';
import 'package:timelines/timelines.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key, required this.state}) : super(key: key);
  final dynamic state;

  @override
  Widget build(BuildContext context) {
    state is ProjectsInitial ? context.read<ProjectsCubit>().getProjectsCubit() : const SizedBox();
    return state is ProjectsGetDataState
        ? state.projectsModel.data!.isNotEmpty
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
                      itemCount: state.projectsModel.data!.length,
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) {
                            return confirmDismissDialog(context, index, "title");
                          },
                          onDismissed: (direction) async {
                            context
                                .read<ProjectsCubit>()
                                .deleteProjectsCubit(id: state.projectsModel.data?[index].id);
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
                                'Project ${state.projectsModel.data![index].name}',
                                textAlign: TextAlign.start,
                              ),
                              Flexible(
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                      'Description: ${state.projectsModel.data![index].description}'),
                                  subtitle: Text('${state.projectsModel.data![index].state}'),
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
                child: Text("You Have no Projects Added"),
              )
        : state is ProjectsInitial
            ? const ShimmerExperienceSkeleton()
            : const SizedBox();
  }
}
