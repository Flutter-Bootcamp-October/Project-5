class EducationModel {
  EducationModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data>? data;
  late final int codeState;

  EducationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['codeState'] = codeState;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.graduationDate,
    required this.university,
    required this.college,
    required this.specialization,
    required this.level,
  });
  late final int id;
  late final int userId;
  late final String graduationDate;
  late final String university;
  late final String college;
  late final String specialization;
  late final String level;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    graduationDate = json['graduationDate'] ?? "";
    university = json['university'] ?? "";
    college = json['college'] ?? "";
    specialization = json['specialization'] ?? "";
    level = json['level'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['graduation_date'] = graduationDate;
    _data['university'] = university;
    _data['college'] = college;
    _data['specialization'] = specialization;
    _data['level'] = level;
    return _data;
  }
}
