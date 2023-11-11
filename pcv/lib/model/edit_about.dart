class AboutModel {
  String? name;
  String? titlePosition;
  String? phone;
  String? location;
  String? about;
  String? birthday;

  AboutModel(
      {this.name,
      this.titlePosition,
      this.phone,
      this.location,
      this.about,
      this.birthday});

  AboutModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    location = json['location'];
    about = json['about'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['location'] = location;
    data['about'] = about;
    data['birthday'] = birthday;
    return data;
  }
}
