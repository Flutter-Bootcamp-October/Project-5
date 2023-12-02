class Skill {
  int? id;
  int? userId;
  String? skill;

  Skill({this.id, this.userId, this.skill});

  Skill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['skill'] = skill;
    return data;
  }
}
