class AboutModel {
  AboutModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  AboutModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    _data['codeState'] = codeState;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.titlePosition,
    required this.phone,
    this.location,
    this.birthday,
    this.about,
    this.image,
    required this.createAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null titlePosition;
  late final String phone;
  late final Null location;
  late final Null birthday;
  late final Null about;
  late final Null image;
  late final String createAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    titlePosition = null;
    phone = json['phone'];
    location = null;
    birthday = null;
    about = null;
    image = null;
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
