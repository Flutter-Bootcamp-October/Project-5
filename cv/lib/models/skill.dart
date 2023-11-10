class Skill {
  String? skill;

  Skill({this.skill});

  Skill.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skill'] = skill;
    return data;
  }
}
