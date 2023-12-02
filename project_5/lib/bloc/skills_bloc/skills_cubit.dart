import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_5/models/skills_model.dart';
import 'package:project_5/services/skills_api.dart';

part 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  SkillsCubit() : super(SkillsInitial());

  getSkillsCubit() async {
    SkillsModel skillsModel = await getSkillsData();
    emit(SkillsGetDataState(skillsModel: skillsModel));
  }

  addSkillsCubit({
    required TextEditingController skillsController,
  }) async {
    if (skillsController.text.isNotEmpty) {
      await addSkills(skill: skillsController.text).then((value) {
        emit(SkillsAddState());
        getSkillsCubit();
        skillsController.clear();
      });
    } else {
      emit(SkillsErrorState(errMsg: "Please Enter a Name for the Skill"));
    }
  }

  deleteSkillsCubit({required int id}) async {
    await deleteSkill(id: id).then((value) {
      emit(SkillsDeleteState());
      getSkillsCubit();
    });
  }
}
