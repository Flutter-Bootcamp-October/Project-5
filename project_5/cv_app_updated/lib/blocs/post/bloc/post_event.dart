part of 'post_bloc.dart';

abstract class PostEvent {}

class PostSkillEvent extends PostEvent {
  final BuildContext context;
  final String skill;

  PostSkillEvent({required this.context, required this.skill});
}

class PostUpdateEvent extends PostEvent {
  final BuildContext context;
  final String user, title, phone, location, birthday, about;

  PostUpdateEvent(
      {required this.context,
      required this.user,
      required this.title,
      required this.phone,
      required this.location,
      required this.birthday,
      required this.about});
}

class PostProjectEvent extends PostEvent {
  final BuildContext context;

  final String projectName, projectDescription, projectState;

  PostProjectEvent(this.context,
      {required this.projectName,
      required this.projectDescription,
      required this.projectState});
}

class PostEducationEvent extends PostEvent {
  final BuildContext context;
  final String university, college, specialization, level, graduationDate;
  PostEducationEvent(
    this.university,
    this.college,
    this.specialization,
    this.level,
    this.graduationDate,
    this.context,
  );
}

class PostSocialEvent extends PostEvent {
  final String username, social;
  final BuildContext context;

  PostSocialEvent(
      {required this.username, required this.social, required this.context});
}

class PostImageEvent extends PostEvent {
  final File? newImage;

  PostImageEvent({required this.newImage});
}
