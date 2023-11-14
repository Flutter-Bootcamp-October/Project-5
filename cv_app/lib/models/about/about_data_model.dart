class AboutData {
  AboutData({
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

  late int id;
  late String name;
  late String email;
  late String titlePosition;
  late String phone;
  late String location;
  late String birthday;
  late String about;
  late String image;
  late String createAt;

  AboutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    titlePosition = json['title_position'] ?? '';
    phone = json['phone'] ?? '';
    location = json['location'] ?? '';
    birthday = json['birthday'] ?? '';
    about = json['about'] ?? '';
    image = json['image'] ?? '';
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['title_position'] = titlePosition;
    _data['phone'] = phone;
    _data['location'] = location;
    _data['birthday'] = birthday;
    _data['about'] = about;
    _data['image'] = image;
    _data['create_at'] = createAt;
    return _data;
  }
}
