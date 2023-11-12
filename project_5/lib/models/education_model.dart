class EducationModel {
  String? msg;
  Data? data;
  int? codeState;

  EducationModel({this.msg, this.data, this.codeState});

  EducationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['codeState'] = codeState;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? graduationDate;
  String? university;
  String? college;
  String? specialization;
  String? level;

  Data(
      {this.id,
      this.userId,
      this.graduationDate,
      this.university,
      this.college,
      this.specialization,
      this.level});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    graduationDate = json['graduation_date'];
    university = json['university'];
    college = json['college'];
    specialization = json['specialization'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['graduation_date'] = graduationDate;
    data['university'] = university;
    data['college'] = college;
    data['specialization'] = specialization;
    data['level'] = level;
    return data;
  }
}
