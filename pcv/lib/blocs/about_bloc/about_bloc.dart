// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pcv/model/about_model.dart';
import 'package:pcv/services/api_about.dart';
part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutInitial()) {
    loadingAbout();
    on<UpdateAbout>((event, emit) async {
      final Response response = await netAbout.editAboutMethod(body: {
        "name": event.username,
        "phone": event.phone,
        "title_position": event.titPosition,
        "location": event.location,
        "about": event.about,
        "birthday": event.birthday
      });
      if (response.statusCode == 200) {
        emit(SuccessAboutState(msg: "update data"));
        loadingAbout();
      } else if (response.statusCode >= 300) {
        emit(ErrorAboutState(
            msg: (await jsonDecode(response.body))["msg"].toString()));
      }
    });
    on<UpdateImage>((event, emit) async {
      try {
        final Response resp =
            await netAbout.aboutUploadMethod(image: event.image!);
        if (resp.statusCode == 200) {
          loadingAbout();
        } else {
          emit(ErrorAboutState(
              msg: (await jsonDecode(resp.body))["msg"].toString()));
        }
      } catch (e) {
        return;
      }
    });
    on<DeleteAccount>((event, emit) async {
      try {
        final Response response = await netAbout.deleteAccountMethod();
        if (response.statusCode == 200) {
          emit(SuccessDeleteAccount());
        } else {
          emit(ErrorAboutState(msg: await jsonDecode(response.body)["msg"]));
        }
      } catch (error) {
        return;
      }
    });
  }
  loadingAbout() async {
    try {
      final dataAbout = await netAbout.aboutMethod();
      emit(GetAboutState(about: dataAbout!));
    } catch (e) {
      return;
    }
  }
}
