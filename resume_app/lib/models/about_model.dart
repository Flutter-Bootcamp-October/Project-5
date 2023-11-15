class About {
  About({
    required this.id,
    required this.name,
    required this.email,
    required this.titlePosition,
    required this.phone,
    required this.location,
    required this.birthday,
    required this.about,
    required this.image,
    required this.createAt,
  });
  late final int id;
  late String? name;
  late final String email;
  late String? titlePosition;
  late String? phone;
  late String? location;
  late String? birthday;
  late String? about;
  late String? image;
  late final String createAt;

  About.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    location = json['location'];
    birthday = json['birthday'];
    about = json['about'];
    image = json['image'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['location'] = location;
    data['birthday'] = birthday;
    data['about'] = about;
    return data;
  }
}
