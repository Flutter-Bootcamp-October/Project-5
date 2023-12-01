// ignore_for_file: invalid_use_of_visible_for_testing_member


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/model/education_model.dart';
import 'package:pcv/services/education_api.dart';

part 'education_event.dart';
part 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    loedingeducation();
    on<AddEducationEvent>((event, emit) async {
      await educationNetwork.addEducationMethod(body: {
        "graduation_date": event.graduationDate,
        "university": event.university,
        "college": event.college,
        "specialization": event.specialization,
        "level": event.level
      });
      loedingeducation();
    });
    on<DeleteEducationEvent>((event, emit) {
      educationNetwork.deleteEducationMethod(body: {"id_education": event.id});
      loedingeducation();
    });
    on<ChangeEvent>(
        (event, emit) => emit(ChangeStateEducaion(state: event.state)));
  }
  loedingeducation() async {
    try {
      final educaton = await educationNetwork.educationMethod();
      emit(GetEducationState(education: educaton!));
    } catch (error) {
      //
    }
  }
}
