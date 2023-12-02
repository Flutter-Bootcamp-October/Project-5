import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cv/services/education/add_education.dart';
import 'package:flutter/material.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    on<EducationEvent>((event, emit) async {
      try {
        if (event.graduation_date.isNotEmpty &&
            event.college.isNotEmpty &&
            event.specialization.isNotEmpty &&
            event.university.isNotEmpty) {
          final response = await addEducation(event.context, {
            "graduation_date": event.graduation_date,
            "university": event.university,
            "specialization": event.specialization,
            "level": event.level,
            "college": event.college
          });
          if (response != null) {
            if (response.statusCode >= 200 && response.statusCode < 300) {
              emit(EducationSuccessState());
          
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
