part of 'edit_profile_bloc.dart';

final class EditProfileEvent {
  final String name;
  final String titlePosition;
  final String phone;
  final String location;
  final String birthday;
  final String about;
  final BuildContext context;
  EditProfileEvent(this.context, this.name, this.titlePosition, this.phone,
      this.location, this.birthday, this.about);
}
