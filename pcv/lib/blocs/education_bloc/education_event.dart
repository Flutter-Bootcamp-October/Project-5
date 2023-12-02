part of 'education_bloc.dart';

abstract class EducationEvent {}

class GetEducation extends EducationEvent {}

class AddEducationEvent extends EducationEvent {
  final String graduationDate;
  final String university;
  final String college;
  final String specialization;
  final String level;

  AddEducationEvent(
      {required this.graduationDate,
      required this.university,
      required this.college,
      required this.specialization,
      required this.level});
}

class ChangeEvent extends EducationEvent {
  final String state;

  ChangeEvent({required this.state});
}

class DeleteEducationEvent extends EducationEvent {
  final int id;

  DeleteEducationEvent({required this.id});
}
