class Verified {
  String? msg;
  Data? data;
  int? codeState;

  Verified({this.msg, this.data, this.codeState});

  Verified.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['codeState'] = this.codeState;
    return data;
  }
}

class Data {
  String? token;
  int? expiresAt;
  String? tokenType;
  int? expiresIn;
  String? email;

  Data(
      {this.token, this.expiresAt, this.tokenType, this.expiresIn, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresAt = json['expiresAt'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresAt'] = this.expiresAt;
    data['tokenType'] = this.tokenType;
    data['expiresIn'] = this.expiresIn;
    data['email'] = this.email;
    return data;
  }
}
