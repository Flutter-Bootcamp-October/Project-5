import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_5/data/global_data.dart';
import 'package:project_5/models/social_model.dart';
import 'package:project_5/screens/profile/components/social.dart';
import 'package:project_5/services/social_api.dart';

part 'social_state.dart';

class SocialCubit extends Cubit<SocialState> {
  SocialCubit() : super(SocialInitial());

  getSocialCubit() async {
    SocialModel socialModel = await getSocialData();
    updateIconsList(socialModel, iconsList, imgs);
    emit(SocialGetDataState(socialModel: socialModel));
  }

  addSocialCubit({
    required String userName,
    required String social,
  }) async {
    if (userName.isNotEmpty) {
      await addSocial(userName: userName, social: social).then((value) {
        emit(SocialAddState());
        getSocialCubit();
      });
    } else {
      emit(SocialErrorState(errMsg: "Please Enter a Name for the Skill"));
    }
  }

  deleteSocialCubit({required int id}) async {
    await deleteSocial(socialId: id).then((value) {
      emit(SocialDeleteState());
      getSocialCubit();
    });
  }
}
