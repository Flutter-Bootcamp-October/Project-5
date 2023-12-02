part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}

class SocialAddState extends SocialState {}

class SocialDeleteState extends SocialState {}

class SocialGetDataState extends SocialState {
  final SocialModel socialModel;
  SocialGetDataState({required this.socialModel});
}

class SocialErrorState extends SocialState {
  final String errMsg;
  SocialErrorState({required this.errMsg});
}
