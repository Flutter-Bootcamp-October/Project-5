part of 'delete_bloc.dart';

abstract class DeleteEvent {}

final class DeleteProjectEvent extends DeleteEvent {
  final int idProject;
  final BuildContext context;
  DeleteProjectEvent(this.idProject, this.context);
}
