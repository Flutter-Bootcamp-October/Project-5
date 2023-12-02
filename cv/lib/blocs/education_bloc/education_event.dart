part of 'education_bloc.dart';

final class EducationEvent {
  final String graduation_date;
  final String university;
  final String college;
  final String level;
  final String specialization;
  final BuildContext context;
  EducationEvent(this.graduation_date, this.university, this.college,
      this.level, this.specialization, this.context);
}
