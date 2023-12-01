import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/blocs/project_bloc/project_bloc.dart';
import 'package:pcv/widgets/title_widget.dart';
import 'add_project.dart';

class GetProjectWidget extends StatelessWidget {
  const GetProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitlesWidget(
          titles: 'Project',
          onPressed: () => addProject(context),
        ),
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is GetProjectState) {
              return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  shrinkWrap: true,
                  children: state.project[0].data!
                      .map((e) =>  Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                child: Container(
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Color(0xffff6700),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: [
                                        Positioned(
                                          bottom: 70,
                                          child: Text(
                                            "${e.name}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text("${e.state}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                        Positioned(
                                          left: 70,
                                          top: 65,
                                          child: IconButton(
                                              onPressed: () {
                                                context.read<ProjectBloc>().add(
                                                    DeleteProjectEvent(
                                                        id: e.id!));
                                              },
                                              icon: const Icon(Icons.delete)),
                                        ),
                                      ]),
                                ),
                              )
                           )
                      .toList());
            }
            return SizedBox();
          },
        )
      ],
    );
  }
}
