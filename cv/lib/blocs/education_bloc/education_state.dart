part of 'education_bloc.dart';

abstract class EducationState {}

final class EducationInitial extends EducationState {}

final class ErrorState extends EducationState {
  final String massege;

  ErrorState(this.massege);
}

final class EducationSuccessState extends EducationState {}
