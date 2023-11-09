class Data {
  int id;
  String idAuth;
  String name;
  String titlePosition;
  String phone;
  String email;
  String location;
  DateTime birthday;
  String about;
  String image;
  Education education;
  Skills skills;
  SocialMedia socialMedia;
  Projects projects;

  Data({
    required this.id,
    required this.idAuth,
    required this.name,
    required this.titlePosition,
    required this.phone,
    required this.email,
    required this.location,
    required this.birthday,
    required this.about,
    required this.image,
    required this.education,
    required this.skills,
    required this.socialMedia,
    required this.projects,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      idAuth: json['id_auth'],
      name: json['name'],
      titlePosition: json['title_position'],
      phone: json['phone'],
      email: json['email'],
      location: json['location'],
      birthday: DateTime.parse(json['birthday']),
      about: json['about'],
      image: json['image'],
      education: Education.fromJson(json['education']),
      skills: Skills.fromJson(json['skills']),
      socialMedia: SocialMedia.fromJson(json['socialMedia']),
      projects: Projects.fromJson(json['projects']),
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

class Skills {
  String skill;

  Skills({required this.skill});

  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      skill: json['skill'],
    );
  }
}

class SocialMedia {
  String username;
  String social;

  SocialMedia({required this.username, required this.social});

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      username: json['username'],
      social: json['social'],
    );
  }
}

class Projects {
  String name;
  String description;
  String state;

  Projects({
    required this.name,
    required this.description,
    required this.state,
  });

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      name: json['name'],
      description: json['description'],
      state: json['state'],
    );
  }
}
