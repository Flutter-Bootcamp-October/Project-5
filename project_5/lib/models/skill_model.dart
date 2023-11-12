class SkillModel {
  SkillModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  SkillModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['msg'] = msg;
    vData['data'] = data.toJson();
    vData['codeState'] = codeState;
    return vData;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.skill,
  });
  late final int id;
  late final int userId;
  late final String skill;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['id'] = id;
    vData['user_id'] = userId;
    vData['skill'] = skill;
    return vData;
  }
}
