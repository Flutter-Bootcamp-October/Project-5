part of 'post_bloc.dart';

abstract class PostState {}

class PostInitialState extends PostState {}

class PostSkillState extends PostState {}

class UpdateImageState extends PostState {
  final File? newSelectedImage;

  UpdateImageState({required this.newSelectedImage});
}

class PostEducationState extends PostState {}

class PostProjectState extends PostState {}

class PostSocialState extends PostState {}
class PostAboutState extends PostState{}

class PostErrorState extends PostState {
  final String message;

  PostErrorState({required this.message});
}
