class AboutData {
  int? id;
  String? name;
  String? email;
  String? titlePosition;
  String? phone;
  String? location;
  String? birthday;
  String? about;
  String? image;
  String? createAt;

  AboutData(
      {this.id,
      this.name,
      this.email,
      this.titlePosition,
      this.phone,
      this.location,
      this.birthday,
      this.about,
      this.image,
      this.createAt});

  AboutData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['title_position'] = this.titlePosition;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['birthday'] = this.birthday;
    data['about'] = this.about;
    data['image'] = this.image;
    data['create_at'] = this.createAt;
    return data;
  }
}
