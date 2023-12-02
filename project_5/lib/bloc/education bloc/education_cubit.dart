import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project_5/models/education_model.dart';
import 'package:project_5/services/education_api.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationInitial());

  getEducation() async {
    EducationModel educationModel = await getEducationData();
    emit(EducationGetDataState(educationModel: educationModel));
  }

  addEducationCubit({
    required TextEditingController gradDateController,
    required TextEditingController collegeController,
    required TextEditingController universityController,
    required TextEditingController specializationController,
    required String selectedLevel,
  }) async {
    if (gradDateController.text.isNotEmpty &&
        collegeController.text.isNotEmpty &&
        universityController.text.isNotEmpty &&
        specializationController.text.isNotEmpty) {
      addEducation(
              level: selectedLevel,
              specialization: specializationController.text,
              college: collegeController.text,
              university: universityController.text,
              gradDate: gradDateController.text)
          .then((value) async {
        emit(EducationAddState());
        getEducation();
        specializationController.clear();
        collegeController.clear();
        universityController.clear();
        gradDateController.clear();
      });
    } else {
      emit(EducationErrorState(errMsg: "Please don't fill all fields"));
      getEducation();
    }
  }

  deleteEducationCubit({required int id}) async {
    await deleteEducation(educationId: id);
    emit(EducationDeleteState());
    getEducation();
  }
}
