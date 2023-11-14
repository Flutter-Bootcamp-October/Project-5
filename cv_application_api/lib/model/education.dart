class Education {
  String? msg;
  List<EducationData>? education_data;
  int? codeState;

  Education({this.msg, this.education_data, this.codeState});

  Education.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      education_data = <EducationData>[];
      json['data'].forEach((v) {
        education_data!.add(new EducationData.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.education_data != null) {
      data['data'] = this.education_data!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class EducationData {
  int? id;
  int? userId;
  String? graduationDate;
  String? university;
  String? college;
  String? specialization;
  String? level;

  EducationData(
      {this.id,
      this.userId,
      this.graduationDate,
      this.university,
      this.college,
      this.specialization,
      this.level});

  EducationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    graduationDate = json['graduation_date'];
    university = json['university'];
    college = json['college'];
    specialization = json['specialization'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['graduation_date'] = this.graduationDate;
    data['university'] = this.university;
    data['college'] = this.college;
    data['specialization'] = this.specialization;
    data['level'] = this.level;
    return data;
  }
}
