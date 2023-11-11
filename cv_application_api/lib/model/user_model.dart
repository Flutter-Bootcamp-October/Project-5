class User {
  String? msg;
  DataUser? dataUser;
  int? codeState;

  User({this.msg, this.dataUser, this.codeState});

  User.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    dataUser = json['data'] != null ? new DataUser.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.dataUser != null) {
      data['data'] = this.dataUser!.toJson();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class DataUser {
  String? email;
  String? name;
  String? phone;
  String? password;

  DataUser({this.email});

  DataUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
