class About {
  About({
    required this.name,
    required this.email,
    required this.titlePosition,
    required this.phone,
    required this.location,
    required this.birthday,
    required this.about,
    required this.image,
  });
  late String name;
  late String email;
  late String titlePosition;
  late String phone;
  late String location;
  late String birthday;
  late String about;
  late String image;

  About.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    email = json['email'];
    titlePosition = json['title_position'] ?? "";
    phone = json['phone'];
    location = json['location'] ?? "";
    birthday = json['birthday'] ?? "";
    about = json['about'] ?? "";
    image = json['image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name ?? "";
    data['email'] = email;
    data['title_position'] = titlePosition ?? "";
    data['phone'] = phone ?? "";
    data['location'] = location ?? "";
    data['birthday'] = birthday ?? "";
    data['about'] = about ?? "";
    data['image'] = image ?? "";
    return data;
  }
}
