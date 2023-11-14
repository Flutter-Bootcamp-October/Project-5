class About {
  About({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final List<Data> data;
  late final int codeState;

  About.fromJson(Map<String, dynamic> json) {
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
  late final String name;
  late final String email;
  late final String titlePosition;
  late final String phone;
  late final String location;
  late final String birthday;
  late final String about;
  late final String image;
  late final String createAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    titlePosition = json['title_position'] ?? "";
    phone = json['phone'] ?? "";
    location = json["location"] ?? "";
    birthday = json["birthday"] ?? "";
    about = json["about"] ?? "";
    image = json["image"] ?? "";
    createAt = json['create_at'] ?? "";
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
