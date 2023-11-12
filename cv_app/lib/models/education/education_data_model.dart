class EducationData {
  EducationData({
    required this.graduationDate,
    required this.university,
    required this.college,
    required this.specialization,
    required this.level,
  });
  late int id;
  late int userId;
  late String graduationDate;
  late String university;
  late String college;
  late String specialization;
  late String level;

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
