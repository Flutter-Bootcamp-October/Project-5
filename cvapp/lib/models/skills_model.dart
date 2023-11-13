class SkillsModel {
  SkillsModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<SingleSkill> data;
  late final int codeState;

  SkillsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => SingleSkill.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final dataJson = <String, dynamic>{};
    dataJson['msg'] = msg;
    dataJson['data'] = data.map((e) => e.toJson()).toList();
    dataJson['codeState'] = codeState;
    return dataJson;
  }
}

class SingleSkill {
  SingleSkill({
    required this.id,
    required this.userId,
    required this.skill,
  });
  late final int id;
  late final int userId;
  late final String skill;

  SingleSkill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['skill'] = skill;
    return data;
  }
}
