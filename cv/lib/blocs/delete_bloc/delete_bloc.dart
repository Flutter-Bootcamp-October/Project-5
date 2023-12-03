import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/models/project.dart';
import 'package:cv/services/education/delete_education.dart';
import 'package:cv/services/project/delete_project.dart';
import 'package:cv/services/project/get_projects.dart';
import 'package:cv/services/skill/delete_skill.dart';
import 'package:cv/services/social/delete_social.dart';
import 'package:flutter/material.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial()) {
    on<DeleteProjectEvent>((event, emit) async {
      //snapshot.data![index].id
      try {
        final response =
            await deleteProject(event.context, {"id_project": event.idProject});
        if (response != null &&
            response.statusCode >= 200 &&
            response.statusCode < 300) {
          final List<Project> projects = await getProjects(event.context);
          emit(ProjectDeleteState(projects));
        } else {
          emit(ErrorState(jsonDecode(response!.body)["msg"]));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });

    on<DeleteEducationEvent>((event, emit) async {
      // snapshot.data![index].id
      try {
        final response = await deleteEducation(
            event.context, {"id_education": event.idEducation});
        if (response != null &&
            response.statusCode >= 200 &&
            response.statusCode < 300) {
          emit(EducationDeleteState());

          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("deleted successfully")));
        } else {
          emit(ErrorState(jsonDecode(response!.body)["msg"]));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });

    on<DeleteSkillEvent>((event, emit) async {
      try {
        final response =
            await deleteSkill(event.context, {"id_skill": event.idSkill});
        if (response != null &&
            response.statusCode >= 200 &&
            response.statusCode < 300) {
          emit(SkillDeleteState());
        } else {
          emit(ErrorState(jsonDecode(response!.body)["msg"]));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });

    on<DeleteSocialEvent>((event, emit) async {
      try {
        final response =
            await deleteSocial(event.context, {"id_social": event.idSocial});
        if (response != null &&
            response.statusCode >= 200 &&
            response.statusCode < 300) {
          emit(SocialDeleteState());
        } else {
          emit(ErrorState(jsonDecode(response!.body)["msg"]));
        }
      } catch (error) {
        emit(ErrorState(error.toString()));
      }
    });
  }
}
