class ErrorModel {
  ErrorModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  late final String msg;
  late final Data data;
  late final int codeState;

  ErrorModel.fromJson(Map<String, dynamic> json) {
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
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}
