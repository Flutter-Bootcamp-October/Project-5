part of 'about_bloc.dart';

abstract class AboutEvent {}

final class UpdateAbout extends AboutEvent {
    final String username;
  final String titPosition;
  final String location;
  final String phone;
  final String about;
  final String birthday;

  UpdateAbout({required this.username, required this.titPosition, required this.location, required this.phone, required this.about, required this.birthday});
}

final class UpdateImage extends AboutEvent {
  final File? image;

  UpdateImage({required this.image});
}

final class DeleteAccount extends AboutEvent {}
