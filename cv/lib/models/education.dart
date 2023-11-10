class Education {
  String? graduationDate;
  String? university;
  String? college;
  String? specialization;
  String? level;

  Education(
      {this.graduationDate,
      this.university,
      this.college,
      this.specialization,
      this.level});

  Education.fromJson(Map<String, dynamic> json) {
    graduationDate = json['graduation_date'];
    university = json['university'];
    college = json['college'];
    specialization = json['specialization'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['graduation_date'] = graduationDate;
    data['university'] = university;
    data['college'] = college;
    data['specialization'] = specialization;
    data['level'] = level;
    return data;
  }
}
