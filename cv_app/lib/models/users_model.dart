class Users {
  int? id;
  String? name;
  String? titlePosition;
  String? phone;
  String? image;

  Users({this.id, this.name, this.titlePosition, this.phone, this.image});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}
