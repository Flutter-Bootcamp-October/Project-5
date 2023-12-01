// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pcv/model/social_model.dart';
import 'package:pcv/services/social_network.dart';

part 'social_event.dart';
part 'social_state.dart';

class SocialBloc extends Bloc<SocialEvent, SocialState> {
  SocialBloc() : super(SocialInitial()) {
    _loedingSocial();
    on<AddSocialEvent>((event, emit) async {
      try {
        final Response resp = await socialNetwork.addsocialMethod(
            body: {"username": event.userName, "social": event.social});
        if (resp.statusCode == 200) {
          _loedingSocial();
        } else {
          emit(ErrorSocialState(msg: await jsonDecode(resp.body)["msg"].toString()));
        }
      } catch (e) {
        emit(ErrorSocialState(msg: e.toString()));
      }
    });
    on<ChangeStateSocialEvent>((event, emit) {
      emit(ChangeState(state: event.state));
    });
    on<DeleteSocialEvent>((event, emit) async {
      await socialNetwork.deletesocialMethod(body: {"id_social": event.id});
      _loedingSocial();
    });
  }
  _loedingSocial() async {
    try {
      final data = await socialNetwork.socialMethod();
      emit(GetSocialState(social: data!));
    } catch (error) {
      //
    }
  }
}
