class Education {
  String? msg;
  List<Data>? data;
  int? codeState;

  Education({this.msg, this.data, this.codeState});

  Education.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['codeState'] = this.codeState;
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
