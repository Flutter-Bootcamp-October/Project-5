import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/social/add_social.dart';
import 'package:flutter/material.dart';

part 'social_event.dart';
part 'social_state.dart';

class SocialBloc extends Bloc<SocialEvent, SocialState> {
  SocialBloc() : super(SocialInitial()) {
    on<SocialEvent>((event, emit) async {
      try {
        if (event.username.isNotEmpty) {
          final response = await addSocial(event.context,
              {"username": event.username, "social": event.social});
          if (response != null) {
            if (response.statusCode >= 200 && response.statusCode < 300) {
              emit(SocialSuccessState());
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
