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
      await addSkills(skill: skillsController.text).then((value) async {
        emit(SkillsAddState());
        getSkillsCubit();
        skillsController.clear();
      });

      // skillsController.clear();
      // emit(SkillsAddState());
      // getSkillsCubit();
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text("Please Enter a Name for the Skill")));
      emit(SkillsErrorState(errMsg: "Please Enter a Name for the Skill"));
    }
  }

  deleteSkillsCubit({required int id}) async {
    await deleteSkill(id: id);
    emit(SkillsDeleteState());
    getSkillsCubit();
  }
}
