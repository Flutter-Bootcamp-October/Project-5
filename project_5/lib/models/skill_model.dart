class SkillModel {
  SkillModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data>? data;
  late final int codeState;

  SkillModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['skill'] = skill;
    return _data;
  }
}
