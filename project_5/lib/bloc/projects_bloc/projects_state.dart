part of 'projects_cubit.dart';

abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsAddState extends ProjectsState {}

class ProjectsDeleteState extends ProjectsState {}

class ProjectsGetDataState extends ProjectsState {
  final ProjectsModel projectsModel;
  ProjectsGetDataState({required this.projectsModel});
}

class ProjectsErrorState extends ProjectsState {
  final String errMsg;
  ProjectsErrorState({required this.errMsg});
}
