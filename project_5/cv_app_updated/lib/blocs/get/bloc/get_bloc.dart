import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_5/api_methods/user_get_methods.dart';
import 'package:project_5/models/about_model.dart';
import 'package:project_5/models/education_model.dart';
import 'package:project_5/models/project_model.dart';
import 'package:project_5/models/skill_model.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/models/user_model.dart';

part 'get_event.dart';
part 'get_state.dart';

class GetBloc extends Bloc<GetEvent, GetState> {
  GetBloc() : super(GetInitialState()) {
    on<GetEducationEvent>((event, emit) async {
      emit(GetLoadState());
      try {
        var response = await UserNetworkingMethods()
            .getEducationMethod(context: event.context);

        emit(GetEducationState(education: response));
      } catch (e) {
        emit(GetErrorState(message: e.toString()));
      }
    });
    on<GetProjectEvent>((event, emit) async {
      emit(GetLoadState());

      try {
        var response = await UserNetworkingMethods()
            .getProjectMethod(context: event.context);

        emit(GetProjectState(project: response));
      } catch (e) {
        emit(GetErrorState(message: e.toString()));
      }
    });
    on<GetSkillEvent>((event, emit) async {
      emit(GetLoadState());

      try {
        var response = await UserNetworkingMethods()
            .getSkillsMethod(context: event.context);

        emit(GetSkillState(skill: response));
      } catch (e) {
        emit(GetErrorState(message: e.toString()));
      }
    });

    on<GetSocialEvent>((event, emit) async {
      emit(GetLoadState());

      try {
        var response = await UserNetworkingMethods()
            .getSocialMethod(context: event.context);

        emit(GetSocialState(social: response));
      } catch (e) {
        emit(GetErrorState(message: e.toString()));
      }
    });

    on<GetUsersEvent>((event, emit) async {
      emit(GetLoadState());

      try {
        var response = await UserNetworkingMethods()
            .getUsersMethod(context: event.context);

        emit(GetUsersState(users: response));
      } catch (e) {
        emit(GetErrorState(message: e.toString()));
      }
    });
  }
}
