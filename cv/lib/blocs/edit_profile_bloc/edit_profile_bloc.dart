import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/user/edit_user.dart';
import 'package:flutter/material.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitial()) {
    on<EditProfileEvent>((event, emit) async {
      try {
        if (event.about.isNotEmpty &&
            event.location.isNotEmpty &&
            event.birthday.isNotEmpty &&
            event.titlePosition.isNotEmpty &&
            event.name.isNotEmpty &&
            event.phone.isNotEmpty) {
          final response = await editUser(event.context, {
            "name": event.name,
            "title_position": event.titlePosition,
            "phone": event.phone,
            "location": event.location,
            "birthday": event.birthday,
            "about": event.about
          });
          if (response != null) {
            if (response.statusCode >= 200 && response.statusCode < 300) {
              emit(EditProfileSuccessState());
              // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              //     content: Text("Your information is updated successfully")));

              // Navigator.pop(context, true);
            } else {
              emit(ErrorState(jsonDecode(response.body)["msg"]));
            }
          }
        } else {
          emit(ErrorState("Please enter all information"));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
  }
}
