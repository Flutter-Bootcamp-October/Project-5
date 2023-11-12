import 'package:cv_app/models/skill/skill_data_model.dart';

class SkillsModel {
  SkillsModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<SkillData> data;
  late final int codeState;

  SkillsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => SkillData.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}


