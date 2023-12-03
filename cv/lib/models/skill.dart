class Skill {
  int? id;
  String? skill;

  Skill({this.id, this.skill});

  Skill.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill'] = skill;
    data['id'] = id;

    return data;
  }
}
