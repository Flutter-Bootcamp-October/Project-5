import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/models/projects_model.dart';
import 'package:project_5/services/projects_api.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(ProjectsInitial());

  getProjectsCubit() async {
    ProjectsModel projectsModel = await getProjectsData();
    emit(ProjectsGetDataState(projectsModel: projectsModel));
  }

  addProjectsCubit({
    required TextEditingController nameController,
    required TextEditingController description,
    required String projectState,
  }) async {
    if (nameController.text.isNotEmpty && description.text.isNotEmpty) {
      await addProjects(
              name: nameController.text, description: description.text, state: projectState)
          .then((value) {
        emit(ProjectsAddState());
        getProjectsCubit();
        nameController.clear();
        description.clear();
      });
    } else {
      emit(ProjectsErrorState(errMsg: "Please fill all fields"));
    }
  }

  deleteProjectsCubit({required int id}) async {
    await deleteProject(projectId: id).then((value) {
      emit(ProjectsDeleteState());
      getProjectsCubit();
    });
  }
}
