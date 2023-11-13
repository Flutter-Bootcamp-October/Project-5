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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title_position'] = this.titlePosition;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}
