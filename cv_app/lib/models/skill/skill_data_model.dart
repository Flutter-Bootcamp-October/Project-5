class SkillData {
  SkillData({
    required this.skill,
  });
  late int id;
  late int userId;
  late String skill;

  SkillData.fromJson(Map<String, dynamic> json) {
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