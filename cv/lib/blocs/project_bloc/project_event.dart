part of 'project_bloc.dart';

final class ProjectEvent {
  final String name;
  final String description;
  final String state;

  final BuildContext context;
  ProjectEvent(this.context, this.name, this.description, this.state);
}
