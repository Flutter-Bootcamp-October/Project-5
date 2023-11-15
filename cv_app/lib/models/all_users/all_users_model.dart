class AllUsersModel {
  AllUsersModel({
    required this.data,
  });
  late final String msg;
  late final List<Data> data;
  late final int codeState;

  AllUsersModel.fromJson(Map<String, dynamic> json) {
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
    required this.idAuth,
    required this.name,
    required this.createAt,
    this.titlePosition,
    required this.phone,
    required this.email,
    this.location,
    this.birthday,
    this.about,
    this.image,
    required this.skills,
    required this.socialMedia,
    required this.education,
    required this.projects,
  });
  late final int id;
  late final String idAuth;
  late final String name;
  late final String createAt;
  late final String? titlePosition;
  late final String phone;
  late final String email;
  late final String? location;
  late final String? birthday;
  late final String? about;
  late final String? image;
  late final List<Skills> skills;
  late final List<SocialMedia> socialMedia;
  late final List<Education> education;
  late final List<Projects> projects;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    idAuth = json['id_auth'] ?? '';
    name = json['name'] ?? '';
    createAt = json['create_at'] ?? '';
    titlePosition = json['title_position'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    location = json['location'] ?? '';
    birthday = json['birthday'] ?? '';
    about = json['about'] ?? '';
    image = json['image'] ?? '';
    skills = List.from(json['skills']).map((e) => Skills.fromJson(e)).toList();
    socialMedia = List.from(json['social_media'])
        .map((e) => SocialMedia.fromJson(e))
        .toList();
    education =
        List.from(json['education']).map((e) => Education.fromJson(e)).toList();
    projects =
        List.from(json['projects']).map((e) => Projects.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['id_auth'] = idAuth;
    _data['name'] = name;
    _data['create_at'] = createAt;
    _data['title_position'] = titlePosition;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['location'] = location;
    _data['birthday'] = birthday;
    _data['about'] = about;
    _data['image'] = image;
    _data['skills'] = skills.map((e) => e.toJson()).toList();
    _data['social_media'] = socialMedia.map((e) => e.toJson()).toList();
    _data['education'] = education.map((e) => e.toJson()).toList();
    _data['projects'] = projects.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Skills {
  Skills({
    required this.id,
    required this.userId,
    required this.skill,
  });
  late final int id;
  late final int userId;
  late final String skill;

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    skill = json['skill'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['skill'] = skill;
    return _data;
  }
}

class SocialMedia {
  SocialMedia({
    required this.id,
    required this.userId,
    required this.username,
    required this.social,
  });
  late final int id;
  late final int userId;
  late final String username;
  late final String social;

  SocialMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? '';
    username = json['username'] ?? '';
    social = json['social'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['username'] = username;
    _data['social'] = social;
    return _data;
  }
}

class Education {
  Education({
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

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    graduationDate = json['graduation_date'] ?? '';
    university = json['university'] ?? '';
    college = json['college'] ?? '';
    specialization = json['specialization'] ?? '';
    level = json['level'] ?? '';
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

class Projects {
  Projects({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.state,
  });
  late final int id;
  late final int userId;
  late final String name;
  late final String description;
  late final String state;

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    state = json['state'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['description'] = description;
    _data['state'] = state;
    return _data;
  }
}
