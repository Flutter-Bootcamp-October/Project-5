part of 'project_bloc.dart';

abstract class ProjectEvent {}

class AddProjectEvent extends ProjectEvent {
  final String name;
  final String description;
  final String state;

  AddProjectEvent(
      {required this.name, required this.description, required this.state});
}

class DeleteProjectEvent extends ProjectEvent {
  final int id;

  DeleteProjectEvent({required this.id});
}
class ChangeStateProjectEvent extends ProjectEvent {
  final String state;

  ChangeStateProjectEvent({required this.state});
}
