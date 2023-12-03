part of 'verification_bloc.dart';

@immutable
sealed class VerificationState {}

final class VerificationInitial extends VerificationState {}

final class ErrorState extends VerificationState {
  final String massege;

  ErrorState(this.massege);
}

final class VerSuccsessState extends VerificationState {}
