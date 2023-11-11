class Education {
  Education({
    this.id,
    this.userId,
    required this.graduationDate,
    required this.university,
    required this.college,
    required this.specialization,
    required this.level, //school, diploma, Bachelors, Master, Ph.D ,other
  });
  late final int? id;
  late final int? userId;
  late final String graduationDate;
  late final String university;
  late final String college;
  late final String specialization;
  late final String level;

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    graduationDate = json['graduation_date'];
    university = json['university'];
    college = json['college'];
    specialization = json['specialization'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['graduation_date'] = graduationDate;
    data['university'] = university;
    data['college'] = college;
    data['specialization'] = specialization;
    data['level'] = level;
    return data;
  }
}
