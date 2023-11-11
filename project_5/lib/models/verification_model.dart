class Verification {
  Verification({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;
  
  Verification.fromJson(Map<String, dynamic> json){
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
    required this.token,
    required this.expiresAt,
    required this.tokenType,
    required this.expiresIn,
    required this.email,
  });
  late final String token;
  late final int expiresAt;
  late final String tokenType;
  late final int expiresIn;
  late final String email;
  
  Data.fromJson(Map<String, dynamic> json){
    token = json['token'];
    expiresAt = json['expiresAt'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['expiresAt'] = expiresAt;
    _data['tokenType'] = tokenType;
    _data['expiresIn'] = expiresIn;
    _data['email'] = email;
    return _data;
  }
}