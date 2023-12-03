class ErrorModel {
  ErrorModel({
    required this.msg,
    required this.data,
    required this.codeState,
  });
  String? msg;
  Data? data;
  int? codeState;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    vData['msg'] = msg;
    vData['data'] = data?.toJson();
    vData['codeState'] = codeState;
    return vData;
  }
}

class Data {
  Data();

  Data.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final vData = <String, dynamic>{};
    return vData;
  }
}
