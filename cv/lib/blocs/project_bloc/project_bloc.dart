import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/project/add_project.dart';
import 'package:flutter/material.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      try {
        if (event.name.isNotEmpty && event.description.isNotEmpty) {
          final response = await addProject(event.context, {
            "name": event.name,
            "description": event.description,
            "state": event.state
          });
          if (response != null) {
            if (response.statusCode >= 200 && response.statusCode < 300) {
              emit(ProjectSuccessState());
            
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
