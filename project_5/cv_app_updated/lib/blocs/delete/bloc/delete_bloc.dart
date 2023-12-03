import 'package:bloc/bloc.dart';
import 'package:project_5/global/globally.dart';
import 'package:project_5/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitialState()) {
    on<DeleteEducationEvent>((event, emit) async {
      try {
        await deleteMethods.removeEducation(idEducation: event.id);
        educationList.remove(event.id);
        emit(DeleteEducationState());
      } catch (e) {
        emit(DeleteErrorState(message: e.toString()));
      }
    });

    on<DeleteSkillEvent>((event, emit) async {
      try {
        await deleteMethods.removeSkill(idSkill: event.id);
        skillList.remove(event.id);
        emit(DeleteSkillState());
      } catch (e) {
        emit(DeleteErrorState(message: e.toString()));
      }
    });
    on<DeleteUserEvent>((event, emit) async {
      try {
        final SharedPreferences pref = await SharedPreferences.getInstance();
        final token = pref.getString('token');
        pref.remove(token!);
        emit(DeleteUserState());
      } on FormatException catch (error) {
        emit(DeleteErrorState(message: error.message.toString()));
      }
    });
    on<DeleteSocialEvent>((event, emit) async {
      try {
        await deleteMethods.removeSocial(idAccount: event.id);
        socialList.remove(event.id);
        emit(DeleteSocialState());
      } catch (e) {
        emit(DeleteErrorState(message: e.toString()));
      }
      //
    });
    on<DeleteProjectEvent>((event, emit) async {
      try {
        await deleteMethods.removeProject(idProject: event.id);
        projectList.remove(event.id);
        emit(DeleteProjectState());
      } catch (e) {
        emit(DeleteErrorState(message: e.toString()));
      }
    });
  }
}
