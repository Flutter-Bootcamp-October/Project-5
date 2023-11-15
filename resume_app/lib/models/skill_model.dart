class Skill {
  Skill({
    this.id,
    this.userId,
    required this.skill,
  });
  late final int? id;
  late final int? userId;
  late final String skill;

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['skill'] = skill;
    return data;
  }
}
