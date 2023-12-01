// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pcv/model/project_model.dart';
import 'package:pcv/services/project_api.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    _loedingProject();
    on<AddProjectEvent>((event, emit) async {
      try {
        final Response resp = await projectNet.addProjectMethod(body: {
          "name": event.name,
          "description": event.description,
          "state": event.state,
        });

        if (resp.statusCode == 200) {
          _loedingProject();
        } else {
          emit(ErrorProjectState(
              msg: (await jsonDecode(resp.body))["msg"].toString()));
        }
      } catch (e) {
        emit(ErrorProjectState(msg: e.toString()));
      }
    });
    on<ChangeStateProjectEvent>((event, emit) {
      emit(ChangeState(state: event.state));
    });
    on<DeleteProjectEvent>((event, emit) async {
      await projectNet.deleteProjectMethod(body: {"id_project": event.id});
      _loedingProject();
    });
  }
  _loedingProject() async {
    try {
      final project = await projectNet.projectMethod();
      emit(GetProjectState(project: project!));
    } catch (error) {
      //
    }
  }
}
