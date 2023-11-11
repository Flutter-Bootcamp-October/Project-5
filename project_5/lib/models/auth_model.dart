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
    final jsonData = <String, dynamic>{};
    jsonData['msg'] = msg;
    jsonData['data'] = data.toJson();
    jsonData['codeState'] = codeState;
    return jsonData;
  }
}

class Data {
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final jsonData = <String, dynamic>{};
    return jsonData;
  }
}
