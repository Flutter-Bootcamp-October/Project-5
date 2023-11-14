class AboutModel {
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

  AboutModel({
    this.id,
    this.name,
    this.email,
    this.titlePosition,
    this.phone,
    this.location,
    this.birthday,
    this.about,
    this.image,
    this.createAt,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      titlePosition: json['title_position'],
      phone: json['phone'],
      location: json['location'],
      birthday: json['birthday'],
      about: json['about'],
      image: json['image'],
      createAt: json['create_at'],
    );
  }
}
