class Allusers {
  Allusers({
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

  Allusers.fromJson(Map<String, dynamic> json) {
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

    return _data;
  }
}
