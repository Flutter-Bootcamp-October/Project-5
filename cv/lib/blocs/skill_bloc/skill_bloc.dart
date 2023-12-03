import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/skill/add_skill.dart';
import 'package:flutter/material.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    on<SkillEvent>((event, emit) async {
      try {
        if (event.skill.isNotEmpty) {
          final response = await addSkill(event.context, {
            "skill": event.skill,
          });
          if (response != null) {
            if (response.statusCode >= 200 && response.statusCode < 300) {
              emit(SkillSuccessState());
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text("Skill is added successfully")));
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
