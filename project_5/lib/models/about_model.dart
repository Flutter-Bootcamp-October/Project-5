class About {
  About({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  About.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['msg'] = msg;
    vData['data'] = data.toJson();
    vData['codeState'] = codeState;
    return vData;
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
    id = json['id'];
    name = json['name'];
    email = json['email'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    location = json["location"];
    birthday = json["birthday"];
    about = json["about"];
    image = json["image"];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['id'] = id;
    vData['name'] = name;
    vData['email'] = email;
    vData['title_position'] = titlePosition;
    vData['phone'] = phone;
    vData['location'] = location;
    vData['birthday'] = birthday;
    vData['about'] = about;
    vData['image'] = image;
    vData['create_at'] = createAt;
    return vData;
  }
}
