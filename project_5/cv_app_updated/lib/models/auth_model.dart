class Auth {
  Auth({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  Auth.fromJson(Map<String, dynamic> json) {
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
    required this.email,
  });
  late final String email;

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['email'] = email;
    return vData;
  }
}
