class SkillsData {
  SkillsData({
    required this.id,
    required this.userId,
    required this.skill,
  });
  late final int id;
  late final int userId;
  late final String skill;

  SkillsData.fromJson(Map<String, dynamic> json) {
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
