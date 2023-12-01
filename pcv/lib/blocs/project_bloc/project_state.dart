part of 'project_bloc.dart';

abstract class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class GetProjectState extends ProjectState {
  final List<ProjectModel> project;

  GetProjectState({required this.project});
}
class ErrorProjectState extends ProjectState {
  final String msg;

  ErrorProjectState({required this.msg});
}
class ChangeState extends ProjectState {
  final String state;

  ChangeState({required this.state});
}

