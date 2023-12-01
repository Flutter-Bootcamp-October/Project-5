// ignore_for_file: invalid_use_of_visible_for_testing_member


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pcv/model/skill_model.dart';
import 'package:pcv/services/skill_api.dart';

part 'skill_event.dart';
part 'skill_state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    loedingSkill();

    on<AddSkill>((event, emit) async {
      await netSkill.addSkillMethod(body: {"skill": event.skill});
      loedingSkill();
    });
    on<DeleteSkill>((event, emit) async {
      await netSkill.deleteSkillMethod(body: {"id_skill": event.id});
      loedingSkill();
    });
  }
  loedingSkill() async {
    try {
      final skill = await netSkill.skillMethod();
      emit(GetSkillState(data: skill!));
    } catch (error) {
      //
    }
  }
}
