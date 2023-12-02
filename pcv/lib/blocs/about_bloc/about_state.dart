part of 'about_bloc.dart';

abstract class AboutState {}

final class AboutInitial extends AboutState {}

final class GetAboutState extends AboutState {
  final AboutModel about;

  GetAboutState({required this.about});
}

final class GetUser extends AboutState {}

final class UpdeteImageState extends AboutState {
  final String path;

  UpdeteImageState({required this.path});
}

final class ErrorAboutState extends AboutState {
  final String msg;

  ErrorAboutState({required this.msg});
}
final class SuccessAboutState extends AboutState {
  final String msg;

  SuccessAboutState({required this.msg});
}
final class SuccessDeleteAccount extends AboutState {}