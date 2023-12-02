part of 'user_bloc.dart';

abstract class UserState {}

final class UserInitial extends UserState {}
final class GetUserState extends UserState {
  final UserModel about;

  GetUserState({required this.about});
}
