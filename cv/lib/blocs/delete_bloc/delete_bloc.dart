import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/models/project.dart';
import 'package:cv/services/project/delete_project.dart';
import 'package:cv/services/project/get_projects.dart';
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
  }
}
