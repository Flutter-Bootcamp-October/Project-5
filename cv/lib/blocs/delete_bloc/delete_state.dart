part of 'delete_bloc.dart';

abstract class DeleteState {}

final class DeleteInitial extends DeleteState {}

final class ErrorState extends DeleteState {
  final String massege;

  ErrorState(this.massege);
}

final class ProjectDeleteState extends DeleteState {
  final List<Project> projects;

  ProjectDeleteState(this.projects);
}
