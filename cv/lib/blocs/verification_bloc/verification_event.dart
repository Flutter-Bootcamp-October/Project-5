part of 'verification_bloc.dart';

final class VerificationEvent {
  final String otp;
  final String email;
    final String type;

  VerificationEvent(this.email, this.otp, this.type);
}
