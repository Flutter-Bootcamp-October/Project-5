class Education {
  Education({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data> data;
  late final int codeState;

  Education.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e) => e.toJson()).toList();
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

// class Education {
//   String? msg;
//   Data? data;
//   int? codeState;

//   Education({this.msg, this.data, this.codeState});

//   Education.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     codeState = json['codeState'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['msg'] = this.msg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['codeState'] = this.codeState;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   int? userId;
//   String? graduationDate;
//   String? university;
//   String? college;
//   String? specialization;
//   String? level;

//   Data(
//       {this.id,
//       this.userId,
//       this.graduationDate,
//       this.university,
//       this.college,
//       this.specialization,
//       this.level});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     graduationDate = json['graduation_date'];
//     university = json['university'];
//     college = json['college'];
//     specialization = json['specialization'];
//     level = json['level'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['graduation_date'] = this.graduationDate;
//     data['university'] = this.university;
//     data['college'] = this.college;
//     data['specialization'] = this.specialization;
//     data['level'] = this.level;
//     return data;
//   }
// }
