part of 'delete_bloc.dart';

abstract class DeleteState {}

class DeleteInitialState extends DeleteState {}

class DeleteSkillState extends DeleteState {}

class DeleteProjectState extends DeleteState {}

class DeleteUserState extends DeleteState {}

class DeleteEducationState extends DeleteState {}

class DeleteSocialState extends DeleteState {}

class DeleteErrorState extends DeleteState {
  final String message;

  DeleteErrorState({required this.message});
}
