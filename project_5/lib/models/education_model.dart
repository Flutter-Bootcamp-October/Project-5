class Education {
  Education({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  Education.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['msg'] = msg;
    vData['data'] = data.toJson();
    vData['codeState'] = codeState;
    return vData;
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
    final vData = <String, dynamic>{};
    vData['id'] = id;
    vData['user_id'] = userId;
    vData['graduation_date'] = graduationDate;
    vData['university'] = university;
    vData['college'] = college;
    vData['specialization'] = specialization;
    vData['level'] = level;
    return vData;
  }
}
