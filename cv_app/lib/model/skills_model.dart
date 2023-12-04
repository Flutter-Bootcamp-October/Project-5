class SkillsModel {
  String? msg;
  Data? data;
  int? codeState;

  SkillsModel({this.msg, this.data, this.codeState});

  SkillsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? skill;

  Data({this.id, this.userId, this.skill});

  Data.fromJson(Map<String, dynamic> json) {
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
