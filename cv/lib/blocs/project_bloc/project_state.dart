part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

final class ErrorState extends ProjectState {
  final String massege;

  ErrorState(this.massege);
}

final class ProjectSuccessState extends ProjectState {}
