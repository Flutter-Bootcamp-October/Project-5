part of 'edit_profile_bloc.dart';

abstract class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class ErrorState extends EditProfileState {
  final String massege;

  ErrorState(this.massege);
}

final class EditProfileSuccessState extends EditProfileState {}
