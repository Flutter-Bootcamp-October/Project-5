class User {
  int id;
  String idAuth;
  String name;
  DateTime createdAt;
  String? titlePosition;
  String phone;
  String email;
  String? location;
  DateTime? birthday;
  String? about;
  String image;
  List<Skill> skills;
  List<SocialMedia> socialMedia;
  List<Education> education;
  List<Project> projects;

  User({
    required this.id,
    required this.idAuth,
    required this.name,
    required this.createdAt,
    required this.phone,
    required this.email,
    required this.image,
    required this.skills,
    required this.socialMedia,
    required this.education,
    required this.projects,
    this.titlePosition,
    this.location,
    this.birthday,
    this.about,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      idAuth: json['id_auth'],
      name: json['name'],
      createdAt: DateTime.parse(json['create_at']),
      titlePosition: json['title_position'],
      phone: json['phone'],
      email: json['email'],
      location: json['location'],
      birthday:
          json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
      about: json['about'],
      image: json['image'],
      skills: List<Skill>.from(
          json['skills'].map((skill) => Skill.fromJson(skill))),
      socialMedia: List<SocialMedia>.from(
          json['social_media'].map((media) => SocialMedia.fromJson(media))),
      education: List<Education>.from(
          json['education'].map((edu) => Education.fromJson(edu))),
      projects: List<Project>.from(
          json['projects'].map((project) => Project.fromJson(project))),
    );
  }
}

class Skill {
  int id;
  int userId;
  String skill;

  Skill({
    required this.id,
    required this.userId,
    required this.skill,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      userId: json['user_id'],
      skill: json['skill'],
    );
  }
}

class SocialMedia {
  int id;
  int userId;
  String username;
  String social;

  SocialMedia({
    required this.id,
    required this.userId,
    required this.username,
    required this.social,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      id: json['id'],
      userId: json['user_id'],
      username: json['username'],
      social: json['social'],
    );
  }
}

class Education {
  int id;
  int userId;
  DateTime graduationDate;
  String university;
  String college;
  String specialization;
  String level;

  Education({
    required this.id,
    required this.userId,
    required this.graduationDate,
    required this.university,
    required this.college,
    required this.specialization,
    required this.level,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'],
      userId: json['user_id'],
      graduationDate: DateTime.parse(json['graduation_date']),
      university: json['university'],
      college: json['college'],
      specialization: json['specialization'],
      level: json['level'],
    );
  }
}

class Project {
  int id;
  int userId;
  String name;
  String description;
  String state;

  Project({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.state,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      description: json['description'],
      state: json['state'],
    );
  }
}
