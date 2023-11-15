class Skill {
  String? msg;
  List<SkillData>? skillData;
  int? codeState;

  Skill({this.msg, this.skillData, this.codeState});

  Skill.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      skillData = <SkillData>[];
      json['data'].forEach((v) {
        skillData!.add(new SkillData.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.skillData != null) {
      data['data'] = this.skillData!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class SkillData {
  int? id;
  int? userId;
  String? skill;

  SkillData({this.id, this.userId, this.skill});

  SkillData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['skill'] = this.skill;
    return data;
  }
}
